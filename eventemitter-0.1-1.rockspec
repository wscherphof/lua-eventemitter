package = "eventemitter"
version = "0.1-1"
source = {
  url = "git://github.com/wscherphof/lua-eventemitter.git",
  branch = "v0.1"
}
description = {
  summary = "Node.js inspired EventEmitter for Lua",
  detailed = [[
    Enable eventing for a (new or existing) object, using `obj:on("event", listener)` and `self:emit("event", data)`
  ]],
  homepage = "http://wscherphof.github.com/lua-eventemitter/",
  license = "LGPL"
}
dependencies = {
  "lua >= 5.2",
  "lunitx >= 0.6"
}
build = {
  type = "builtin",
  copy_directories = {"doc", "tst"},
  modules = {
    ["EventEmiter.init"] = "src/EventEmitter/init.lua"
  }
}