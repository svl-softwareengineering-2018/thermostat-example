require_relative 'thermostat_output_state'

class ThermostatLogic

    def calculate(temperatures)
        state = ThermostatOutputState.new
        state.enable_heating if heating? temperatures
        state.enable_cooling if cooling? temperatures
        state
    end

    def heating? temperatures
        temperatures.current < temperatures.wanted - temperatures.range
    end

    def cooling? temperatures
        temperatures.current > temperatures.wanted + temperatures.range
    end

end