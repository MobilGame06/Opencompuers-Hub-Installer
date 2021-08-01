local component = require("component")
local nfcdata = "default"

io.write "Type your NFC_Data:\n"
nfcdata = io.read()

if nfcdata == "default" then

else
component.NFCProgrammer.clearNFCData()
component.NFCProgrammer.writeNFCData(nfcdata)
end
