local util = {}

--- @param key string
--- @param mods string
--- @param action any
util.createKeyBind = function (key, mods, action)
  return {key=key, mods=mods, action=action}
end

util.forEach = function (target, callback)
  for key, value in pairs(target) do
    callback(value, key)
  end
end

util.map = function (target, callback)
  local result = {}
  for key, value in pairs(target) do
    result[key] = callback(value, key)
  end
  return result
end

return util
