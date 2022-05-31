--- @param key string
--- @param mods string
--- @param action any
local function createKeyBind (key, mods, action)
  return {key=key, mods=mods, action=action}
end

local function forEach (target, callback)
  for key, value in pairs(target) do
    callback(value, key)
  end
end

local function map (target, callback)
  local result = {}
  for key, value in pairs(target) do
    result[key] = callback(value, key)
  end
  return result
end

local function flat (input, level)
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

local function nest_blank(n)
  local result = ""
  local i = 0
  while i < n do
    result = result .. "  "
    i = i + 1
  end
  return result
end


local function table_to_string (input)
  local result = "{\n"

  local function inner_table_to_string(inner_input, nest_level)
    forEach(inner_input, function(v, k)
      if type(v) == "table" then
        result = result
          .. nest_blank(nest_level)
          .. k
          .. ": "
          .. inner_table_to_string(v, nest_level + 1)
          .. "\n"
      else
        result = result .. k .. ": " .. v .. "\n"
      end
    end)
  end

  inner_table_to_string(input, 0)
  result = result .. "}"
  return result
end

return {
  createKeyBind = createKeyBind,
  forEach = forEach,
  map = map,
  flat = flat,
  table_to_string = table_to_string
}
