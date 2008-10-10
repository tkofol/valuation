module Valuation
  
  class InterestRate
    attr_accessor :rate
    @@periods = {:yearly => 1,
                 :bi_annualy => (1/2.0),
                 :quarterly => (1/4.0),
                 :monthly => (1/12.0),
                 :weekly => (1/52.0),
                 :daily => (1/365.0)}
    
    #Setup The Period Methods
    @@periods.each_pair do |period, n| 
      define_method "#{period}" do
        convert_period n
      end
    end
    
    def self.add_time_periods(periods)
      @@periods.merge(periods)
      periods.each_pair do |period, n| 
        define_method "#{period}" do
          convert_period n
        end
      end
    end
     
    def initialize(rate, options = {})
      @rate = rate
    end
    
    private
      def convert_period(n)
        ((1 + @rate) ** n) - 1
      end 
  end
  
end