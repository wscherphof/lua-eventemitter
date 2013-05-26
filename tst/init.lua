require("luarocks.loader")
-- Omit next line in actual module clients; it's only to support development of the module itself
package.path = "../src/?/init.lua;" .. package.path

local lunitx = require("lunitx")
module("test_eventemitter", lunitx.testcase, package.seeall)

local EventEmitter = require("EventEmitter")

function test_emit()
  local ee = EventEmitter:new()
  function ee:action ()
    self:emit("fire")
  end
  local t
  ee:on("fire", function ()
    t = true
  end)
  ee:action()
  assert(t)
end

function test_data()
  local ee = EventEmitter:new()
  function ee:action ()
    self:emit("fire", true)
  end
  local t
  ee:on("fire", function (d)
    t = d
  end)
  ee:action()
  assert(t)
end

function test_data_multi()
  local ee = EventEmitter:new()
  function ee:action ()
    self:emit("fire", true, true, true)
  end
  local t, tt, ttt
  ee:on("fire", function (d, dd, ddd)
    t, tt, ttt = d, dd, ddd
  end)
  ee:action()
  assert(t)
  assert(tt)
  assert(ttt)
end
