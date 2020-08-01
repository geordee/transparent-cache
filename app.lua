local lapis = require("lapis")
local socket = require("socket")
local app = lapis.Application()

app:get("/", function()
  return "Welcome to Lapis " .. require("lapis.version")
end)

app:get("/slow", function()
  socket.sleep(3)
  return "Slow API, returns after 3 seconds<br />Generated at " .. os.date("%Y-%m-%d %H:%M:%S")
end)

return app
