local lustache = require "lustache"
local json = require "json"

local dataFile = assert(io.open(arg[1], "rb"))
local content = dataFile:read("*all")
local data = json.decode(content)

local tmplFile = assert(io.open(arg[2], "rb"))
local tmpl = tmplFile:read("*all")

local output = lustache:render(tmpl, data)

local outFile = assert(io.open("index.html", "w"))

outFile:write(output)

dataFile:close()
tmplFile:close()
outFile:close()
