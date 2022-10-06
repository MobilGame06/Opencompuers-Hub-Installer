local term = require("term")
local computer = require("computer")
local shell = require("shell")
local text = require("text")

package.loaded.BrainInstallerList = nil
os.remove("/lib/OpencomputersHubInstallerList.lua")
computer.beep(850,0.15)
computer.beep(1000,0.08)
os.execute("wget 'https://raw.githubusercontent.com/MobilGame06/Opencomputers-Hub-Installer/main/program_list.lua' /lib/OpencomputersHubInstallerList.lua")
package.loaded.BrainInstallerList = nil
local list = require("OpencomputersHubInstallerList")

local args, options = shell.parse(...)
if #args < 1 then
    io.write("---------------------------------- \n")
    io.write("Usage: och_installer_cmd [package] \n")
    io.write("---------------------------------- \n")
    return
  end
options.q = options.q or options.Q
local prog = text.trim(args[1])
prog = prog:lower()

print(prog)
local dl = list[prog]

if not list[prog] then
    term.write("Unknown package \n")
    computer.beep(1000,0.15)
    os.sleep(1)
    os.exit()
  else
      term.write("Downloading \n")
      computer.beep(200,0.08)
  end
os.execute("wget '".. dl.id .."' ".. dl.file)
computer.beep(950,0.08)
term.clear()
term.write("Your file has been downloaded to " .. dl.file)
