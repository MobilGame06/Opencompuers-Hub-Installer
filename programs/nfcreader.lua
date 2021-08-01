local component = require("component")
local event = require("event")

while true do
 local type ,_,_, message = event.pull(2, "nfc_data")
 if type == "nfc_data" then
 print(message)
 end
 end
