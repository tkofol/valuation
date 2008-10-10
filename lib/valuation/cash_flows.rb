module Valuation
  
  class CashFlows
    
    def initialize(flows, options = {})
      @flows = flows
      @i = options[:i] || 0
    end
    
    def present_value
      value = 0
      @flows.each_index do |n|
        value += @flows[n] / ((1+@i)**n).to_f
      end
      value
    end
    
    def future_value
      value = 0
      @flows.reverse.each_index do |n|
        value += @flows[n] * ((1+@i)**n).to_f
      end
      value
    end
    
    def irr(significant_digits=4)
      limit = 10**-(significant_digits)
      estimate = @flows.sum/(@flows.size-1.0)/75.0
      delta = estimate.abs
      n = npv(@flows,estimate)
      while n.abs > limit
        sign = n/n.abs
        if (delta.abs < limit/1000)
          delta=estimate.abs               #if we aren't getting anywhere, take a big jump
          return sign/0.0 if (n-@flows[0]).abs < limit
        end
        estimate += (delta/=2) * sign
        n = npv(@flows,estimate)
      end
      estimate
    end
    
  end
    
end