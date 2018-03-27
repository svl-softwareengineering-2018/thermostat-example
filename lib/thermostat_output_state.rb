
class ThermostatOutputState

    private
    attr_accessor :cooling, :heating

    public

    def initialize(cooling = false, heating = false)
        @cooling = cooling
        @heating = heating
    end

    def cooling?
        !!cooling
    end

    def heating?
        !!heating
    end

    def enable_cooling
        enable_state('cooling')
    end

    def enable_heating
        enable_state('heating')
    end

    def disable_cooling
        disable_state('cooling')
    end

    def disable_heating
        disable_state('heating')
    end

    private
    def enable_state(state)
        set_state(state, true)
    end

    def disable_state(state)
        set_state(state, false)
    end

    def set_state(state, value)
        self.send("#{state}=", value)
    end


end