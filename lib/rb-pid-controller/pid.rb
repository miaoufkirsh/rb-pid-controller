
module PIDController

  class PID

    attr_accessor :kp, :ki, :kd, :consign
    
    def initialize(kp = 1 ,ki = 1,kd = 1, history_depth_=-1)
      # save pid coefficient
      @kp            = kp.to_f
      @ki            = ki.to_f
      @kd            = kd.to_f
      @history_depth = history_depth_
      @consign       = nil
      @history       = Array.new

      self.reset 
      
    end
    
    #Public methods
    public
    
    def set_consign(consign)
      @consign = consign.to_f
    end
    
    def <<(value)
      e,dt = error(value)

      out = proportional(e) + integrative(e,dt) + derivative(e,dt)
      @previous_error = e
      
      return out
    end
    
    def reset
      @previous_error = 0.0
      @integrative = 0.0
      @last_time = nil
    end
    
    #Private methods
    private 
    
    def error(value)
      out = value - @consign
      
      t = Time.now.to_i
      if @last_time.nil?
        dt = 1.0
      else
        dt = (t - @last_time).to_f
      end
      @last_time = t
      return out,dt
    end
    
    # compute the proportional term
    def proportional(error)
      return @kp*error
    end
    
    # compute the derivative term
    def derivative(error,dt)
      return @kd*(error - @previous_error)/dt
    end
    
    # compute the integrative term
    def integrative(error,dt)
      # classic mode
      @integrative = @integrative + error*dt

      # window mode
      if(@history_depth != -1)
        @history << error*dt                     # push last sample
        @history = @history.last(@history_depth) # keep the last one
        @integrative =  0
        @history.each { |e|
          @integrative +=e
        }
        @integrative /= @history_depth          # normalize
      end

      return @ki*@integrative
    end
    


  end

  class PD < PID
    def initialize(kp,kd)
      super(kp,0,kd)
    end
  end

  class PI < PID
    def initialize(kp,ki)
      super(kp,ki,0)
    end
  end

end
