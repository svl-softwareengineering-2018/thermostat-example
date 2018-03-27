require_relative 'lib/thermostat'
require_relative 'lib/temperature'

class ThermostatApplication

    def initialize
        thermostat = Thermostat.new 20

        [
            Temperature.new(19), 
            Temperature.new({ fahrenheit: 68}), 
            Temperature.new({ kelvin: (21 + 273.15)})

        ].each do |temperature |
            result = thermostat.update(temperature.to_celsius)
            puts result.inspect
        end
    end

end

ThermostatApplication.new
