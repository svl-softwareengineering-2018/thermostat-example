class Temperature
    private
    attr_writer :temperature

    KELVIN_SHIFT = 273.15
    FAHRENHEIT_OFFSET = 32
    FAHRENHEIT_SLOPE = Rational(9,5)

    public
    attr_reader :temperature

    def initialize temperature
      temperature = { celsius: temperature} if temperature.is_a?(Numeric)

      self.temperature = from_kelvin temperature[:kelvin] if temperature.has_key?(:kelvin)
      self.temperature = from_celsius temperature[:celsius] if temperature.has_key?(:celsius)
      self.temperature = from_fahrenheit temperature[:fahrenheit] if temperature.has_key?(:fahrenheit)
    end

    def to_celsius
        temperature.to_f
    end

    def to_fahrenheit
        ((to_celsius * FAHRENHEIT_SLOPE) + FAHRENHEIT_OFFSET).to_f
    end

    def to_kelvin
        (to_celsius + KELVIN_SHIFT).to_f
    end

    private
    def from_celsius value
      temperature = value
    end

    def from_fahrenheit value
      temperature = (value - FAHRENHEIT_OFFSET) / FAHRENHEIT_SLOPE
    end

    def from_kelvin value
      temperature = value - KELVIN_SHIFT
    end
end