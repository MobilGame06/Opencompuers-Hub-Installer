local c = require("computer")

function round(num, idp)
  if idp and idp>0 then
    local mult = 10^idp
    return math.floor(num * mult + 0.5) / mult
  end
  return math.floor(num + 0.5)
end

function freeMemory()
  local result = 0
  for i = 1, 10 do
    result = math.max(result, c.freeMemory())
    os.sleep(0)
  end
  return result
end

print(round(freeMemory() / 1024, 2), "kB free")
