include Math
module Valuation
  
  class InterestRate
    attr_accessor :rate
    @@periods = {:yearly => 1.0,
                 :semiannually => (1/2.0),
                 :bi_annually => (1/2.0),
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
    
    # Add a unique time period. If you need different time
    # periods that are not provided by default
    # 
    # All time periods are measured to a base time period of 1 year
    # so to add an hourly time period
    #
    # InterestRate.add_time_periods(:hourly => (1/(365*24)))
    # This time period will now be available, in the init method.
    # It will also add a instance method hourly
    def self.add_time_periods(periods)
      @@periods.merge(periods)
      periods.each_pair do |period, n| 
        define_method "#{period}" do
          convert_period n
        end
      end
    end
     
    #  All interest rates are converted to EAR rates.
    #  So the base time period is one year. 
    #  
    #  10% EAR rate: InterestRate.new(0.10)
    #  
    #  5% EMR rate: InterestRate.new(0.05, :monthly)
    #
    #  12% APR compounded monthly InterestRate.new(0.12, :apr, :compounded => :monthly)
    #
    #  Custom Period 5% Compounded every third of the year InterestRate.new(0.05, 1/3.0)
    def initialize(rate, type=:yearly, options = {})
      if type.class.to_s == 'Float'
        @rate = convert_period(1/type, rate)
      elsif type.to_sym == :apr
        options = {:compounded => :yearly}.merge(options)
        factor = @@periods[options[:compounded]]
        @rate = (1 + (rate*factor.to_f))**(1/factor.to_f) - 1
      else
        @rate = convert_period(1/@@periods[type], rate)
      end
    end
    
    # The continous interest rate for a given time period t
    def continuous(t)
      E ** (rate * t) - 1
    end
    
    private
      def convert_period(n, rate=@rate)
        ((1 + rate) ** n) - 1
      end 
  end
  
end