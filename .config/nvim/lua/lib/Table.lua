local forEach = function (target, callback)
  for key, value in pairs(target) do
    callback(value, key)
  end
end

local map = function (target, callback)
  local result = {}
  for key, value in pairs(target) do
    result[key] = callback(value, key)
  end
  return result
end

local flat = function (input, level)
  local result = {}
  if level == nil then
    level = 1
  end

  local function inner_flat(inner_input, current_level)
    forEach(inner_input, function(v, _)
      if current_level == 0 then
        table.insert(result, v)
      elseif type(v) == "table" then
        inner_flat(v, current_level - 1)
      else
        table.insert(result, v)
      end
    end)
  end
  inner_flat(input, level)

  return result
end

local filter = function (target, callback)
  local result = {}
  for key, value in pairs(target) do
    if callback(value, key) then
      result[key] = value
    end
  end
  return result
end

local reduce = function (target, callback, initial)
  local result = initial
  for key, value in pairs(target) do
    result = callback(result, value, key)
  end
  return result
end

local find = function (target, callback)
  for key, value in pairs(target) do
    if callback(value, key) then
      return value
    end
  end
  return nil
end

local findKey = function (target, callback)
  for key, value in pairs(target) do
    if callback(value, key) then
      return key
    end
  end
  return nil
end

local some = function (target, callback)
  for key, value in pairs(target) do
    if callback(value, key) then
      return true
    end
  end
  return false
end

local every = function (target, callback)
  for key, value in pairs(target) do
    if not callback(value, key) then
      return false
    end
  end
  return true
end

local count = function (target, callback)
  local result = 0
  for key, value in pairs(target) do
    if callback(value, key) then
      result = result + 1
    end
  end
  return result
end

-- target/callback（類別）
local groupBy = function (target, callback)
  local result = {}
  for key, value in pairs(target) do
    local group = callback(value, key)
    if result[group] == nil then
      result[group] = {}
    end
    table.insert(result[group], value)
  end
  return result
end

local keys = function (target)
  local result = {}
  for key, _ in pairs(target) do
    table.insert(result, key)
  end
  return result
end

local Table = function (initial)
  local value = initial or {}

  return {
    value = value,
    forEach = function (callback) forEach(value, callback) end,
    map = function (callback) return map(value, callback) end,
    flat = function (level) return flat(value, level) end,
    filter = function (callback) return filter(value, callback) end,
    reduce = function (callback, reduce_initial) return reduce(value, callback, reduce_initial) end,
    find = function (callback) return find(value, callback) end,
    findKey = function (callback) return findKey(value, callback) end,
    some = function (callback) return some(value, callback) end,
    every = function (callback) return every(value, callback) end,
    count = function (callback) return count(value, callback) end,
    groupBy = function (callback) return groupBy(value, callback) end,
    keys = function () return keys(value) end,
  }
end

return {
  new = Table,
  forEach = forEach,
  map = map,
  flat = flat,
  filter = filter,
  reduce = reduce,
  find = find,
  findKey = findKey,
  some = some,
  every = every,
  count = count,
  groupBy = groupBy,
  keys = keys,
}
