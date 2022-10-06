local term = require("term")

term.clear()

print("Choose what to install.")
print("[1] Och-Installer-GUI")
print("[2] Och-Installer-CMD")
local input = io.read()

if input == "1" then
os.execute("wget 'https://raw.githubusercontent.com/MobilGame06/Opencomputers-Hub-Installer/main/installerGui.lua' /usr/bin/och_installer.lua")
print("to start the program you just need to type: och_installer")

elseif input == "2" then
os.execute("wget 'https://raw.githubusercontent.com/MobilGame06/Opencomputers-Hub-Installer/main/installerCmd.lua' /usr/bin/och_installer_cmd.lua")
print("to start the program you just need to type: och_installer_cmd [package]")
end 

term.clear()