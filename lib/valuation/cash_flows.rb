module Valuation
  
  class CashFlows
    
    def initialize(flows, options = {})
      @flows = flows
      @i = options[:i] 
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
    
  end
    
end