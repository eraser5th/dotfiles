local icons = {
  BATTERY_10 = utf8.char(0xf579),
  BATTERY_20 = utf8.char(0xf57a),
  BATTERY_30 = utf8.char(0xf57b),
  BATTERY_40 = utf8.char(0xf57c),
  BATTERY_50 = utf8.char(0xf57d),
  BATTERY_60 = utf8.char(0xf57e),
  BATTERY_70 = utf8.char(0xf57f),
  BATTERY_80 = utf8.char(0xf580),
  BATTERY_90 = utf8.char(0xf581),
  BATTERY_100 = utf8.char(0xf578),
  BATTERY_CHARGING = utf8.char(0xf583),
  BATTERY_0 = utf8.char(0xf244),
  BATTERY_1 = utf8.char(0xf243),
  BATTERY_2 = utf8.char(0xf242),
  BATTERY_3 = utf8.char(0xf241),
  BATTERY_4 = utf8.char(0xf240),
  CLOCK = utf8.char(0xf64f),
  SOLID_RIGHT_ARROW = utf8.char(0xe0b0),
  SOLID_LEFT_ARROW = utf8.char(0xe0b2),
  SOLID_RIGHT_HALF_CIRCLE = utf8.char(0xe0b4),
  SOLID_LEFT_HALF_CIRCLE = utf8.char(0xe0b6),
  GIT_BRANCH = utf8.char(0xe0a0),
}

icons.fn = {
  BATTERY = function (percent, isCharging)
    if isCharging then
      return icons.BATTERY_CHARGING
    end

    if percent <= 10 then return icons.BATTERY_10
    elseif percent <= 20 then return icons.BATTERY_20
    elseif percent <= 30 then return icons.BATTERY_30
    elseif percent <= 40 then return icons.BATTERY_40
    elseif percent <= 50 then return icons.BATTERY_50
    elseif percent <= 60 then return icons.BATTERY_60
    elseif percent <= 70 then return icons.BATTERY_70
    elseif percent <= 80 then return icons.BATTERY_80
    elseif percent <= 90 then return icons.BATTERY_90
    else return icons.BATTERY_100
    end
  end
}

return icons

