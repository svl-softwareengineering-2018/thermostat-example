
class ThermostatInputState

    attr_reader :current, :wanted, :range
    
    def initialize(wanted, range)
        @wanted = wanted
        @range = range
        update_temperature wanted
    end

    def update_temperature (temperature)
        @current = temperature
    end

end