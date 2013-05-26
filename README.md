#LuaRock "eventemitter"

Node.js inspired EventEmitter for Lua

##Install
EventEmitter is a listed [LuaRock](http://luarocks.org/repositories/rocks/). Install using [LuaRocks](http://www.luarocks.org/): `luarocks install eventemitter`

###Dependencies
- [Lua 5.2](http://www.lua.org/download.html)
- [lunitx](https://github.com/dcurrie/lunit) for running the tests (if missing, installed along automatically by LuaRocks)

##Usage
Start off with
```lua
require("luarocks.loader")
local EventEmitter = require("EventEmitter")
```
Create an EventEmitter object
```lua
local obj = EventEmitter:new()
```
Or spray EventEmitter on your existing object
```lua
local obj = {}
EventEmitter:new(obj)
```
Let your object emit a named event on certain conditions
```lua
function obj:action ()
  self:emit("fire")
end
```
Listen for named events
```lua
obj:on("fire", function ()
  print("obj on fire!")
end)
```
You can pass data with the event
```lua
function obj:connect (address)
  local connection = self.connector:createConnection(address)
  if not connection then
    self:emit("error", "Could not connect to address " .. address)
    return
  end
  -- do connection things
end
obj:on("error", function (message)
  print("Error", message)
end)
```

##Tests
See `./tst/init.lua`

##License
LGPL; see `./doc/LICENSE`
