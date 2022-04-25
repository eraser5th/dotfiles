local util = {}

function util.forEach(t, f)
  for k, v in pairs(t) do
    f(v, k)
  end
end

return util
