
require_relative 'thermostat_logic'
require_relative 'thermostat_input_state'

class Thermostat

    attr_reader :input, :output
    attr_accessor :logic

    private
    attr_writer :output, :input, :logic
    
    public

    def initialize(wanted_value, range = 0.5)
        @input = ThermostatInputState.new wanted_value, range
        @logic = ThermostatLogic.new
        @output = nil
    end

    def update(temperature)
        input.update_temperature(temperature)
        @output = logic.calculate input
    end

end