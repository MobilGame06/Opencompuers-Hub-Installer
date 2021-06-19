
local comp = require("component")
local term = require("term")
local computer = require("computer")
local gpu = comp.gpu
  

os.execute("wget 'https://raw.githubusercontent.com/MobilGame06/Opencomputers-Hub-Installer/main/program_list.lua' /lib/OpencompuersHubInstallerList.lua")
package.loaded.BrainInstallerList = nil
local list = require("OpencomputersHubInstallerList")

mX = 100
mY = 40

gpu.setResolution(mX,mY)

term.clear()
computer.beep(850,0.15)
computer.beep(1000,0.08)

::SELECT::

term.clear()
gpu.setBackground(5258796)
gpu.fill(1,1,mX,mY," ")
gpu.setForeground(2832832)
gpu.set((mX/2)-7,1,"OpencompuersHubInstaller")
gpu.set((mX/3),3,"Install:")
term.setCursor((mX/3)+9,3)
local prog = term.read()
prog = prog:sub(1,-2)
prog = prog:lower()

local dl = list[prog]

if not list[prog] then
  gpu.set((mX/3),4,"Unknown")
  computer.beep(1000,0.15)
  os.sleep(1)
  goto SELECT
else
    gpu.set((mX/3),4,"Downloading")
    computer.beep(200,0.08)
end

gpu.setForeground(2832832)
term.setCursor(1,mY-2)
os.execute("wget '".. dl.id .."' ".. dl.file)
gpu.setForeground(2832832)
gpu.set((mX/3),5,"Done")
computer.beep(950,0.08)

::AGAIN::
gpu.fill(1,6,mX,mY," ")
gpu.set((mX/3),6,"Again? [Y/N]")
term.setCursor((mX/3)+14,6)
local again = term.read()
again = again:sub(1,-2)
again = again:lower()

if again == "y" then
  computer.beep(900,0.05)
  goto SELECT
elseif again == "n" then

  package.loaded.BrainInstallerList = nil
  os.remove("/lib/OpencompuersHubInstallerList.lua")
  computer.beep(900,0.05)
::REBOOT::

  gpu.set((mX/3),7,"Reboot? [Y/N]")
  term.setCursor((mX/3)+14,7)
  local reboot = term.read()
  reboot = reboot:sub(1,-2)
  reboot = reboot :lower()

  if reboot == "y" then
    for x=0,3 do
	  os.sleep(1)
      gpu.set((mX/3),8,"Rebooting: ".. tostring(3-x))
	  computer.beep(750,0.02)
    end
    computer.beep(900,0.05)
    computer.shutdown(true)
  elseif reboot == "n" then
	computer.beep(300,0.2)
	gpu.setBackground(5258796)
	gpu.setForeground(2832832)
    gpu.setResolution(mX*3,mY*3)
	term.clear()
  else
	gpu.fill(mX,7,mX,1," ")
    computer.beep(300,0.15)
    goto REBOOT
  end
else
  computer.beep(300,0.15)
  gpu.fill(mX,6,mX,1," ")
  goto AGAIN
end
