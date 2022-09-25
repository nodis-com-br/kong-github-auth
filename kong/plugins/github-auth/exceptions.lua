local utils = require "kong.tools.utils"
local kong = kong


local M = {}


function M.shouldIgnoreRequest(conf)

  for _, paths in ipairs(conf.allowed_paths) do
    if string.find(kong.request.get_path(), paths) ~= nil then
      return true
    end
  end

  if utils.table_contains(conf.allowed_methods, kong.request.get_method()) then
    return true
  end

  if utils.table_contains(conf.allowed_origins, kong.client.get_forwarded_ip()) then
    return true
  end

  return false

end

return M
