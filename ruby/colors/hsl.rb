class Hsl
  attr_reader :hue, :saturation, :light

  def initialize(hue, saturation, light)
    @hue = hue.to_f
    @saturation = saturation.to_f
    @light = light.to_f
  end

  def matches?(hsl)
    correct_saturation?(hsl) && correct_light?(hsl) && correct_hue?(hsl)
  end

  private

  def correct_saturation?(hsl)
    (saturation - hsl.saturation).abs <= 10
  end

  def correct_light?(hsl)
    (light - hsl.light).abs <= 10
  end

  def correct_hue?(hsl)
    angle_1 = (hue - hsl.hue).abs
    angle_2 = (hue + 360 - hsl.hue).abs
    correct_angle_difference?(angle_1) || correct_angle_difference?(angle_2)
  end

  def correct_angle_difference?(difference)
    (110..130).include?(difference) || (170..190).include?(difference) || (230..250).include?(difference)
  end
end
