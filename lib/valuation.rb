$:.unshift File.dirname(__FILE__)     # For use/testing when no gem is installed
require 'valuation/cash_flows'
require 'valuation/core_ext'
require 'valuation/interest_rate'

module Valuation
  
  # Returns the present value of a perpetuity
  #
  # c = Cash flow at time 1
  # i = Interest rate
  # Optional g = Growth rate
  def perpetuity(c, i, g=0)
    c / (i-g).to_f
  end
  
  # Returns the present value of an annuity
  #
  # c = Cash flow at time 1
  # i = Interest rate
  # n = The number of time periods
  # options hash 
  #  :g = Growth Rate Defauls to 0
  #  :pv = Defaults to true
  def annuity(c, i, n, options = {})
    options = {:g => 0, :pv => true}.merge(options)
    g = options[:g]
    pv = c * (1/(i-g).to_f) * (1 - ((1+g)/(1+i).to_f) ** n)
    if options[:pv] == true
      pv
    else
      pv * (1+i) ** n
    end
  end
  
  # Returns the present value of a stream of cash flows
  # that have an interest rate r
  #
  # c = Array of cash flows
  # r = intrest rate as a decimal
  def npv(c, r)
    npv=0
    c.each_with_index do |c_t,t|
      npv += c_t.to_f / (1.0+r)**t.to_f
    end
    npv
  end
  
  
end