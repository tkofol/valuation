require File.dirname(__FILE__) + '/test_helper.rb'
include Valuation

class TestCashFlows < Test::Unit::TestCase
  
  def test_cash_flow_pv
    cf = CashFlows.new([10,10,10], :i => 0.10)
    assert_in_delta 27.3553, cf.present_value, 0.01
  end
  
  def test_cash_flow_fv
    cf = CashFlows.new([10,10,10], :i => 0.10)
    assert_in_delta 33.1, cf.future_value, 0.01
  end
  
  def test_irr
    cf = CashFlows.new([-10,10,10])
    assert_in_delta 0.61803, cf.irr, 0.01
  end
end
