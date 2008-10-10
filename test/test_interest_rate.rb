require File.dirname(__FILE__) + '/test_helper.rb'
include Valuation

class TestInterestRate < Test::Unit::TestCase
  
  def test_yearly
    rate = InterestRate.new(0.10)
    assert_in_delta 0.10, rate.yearly, 0.0001
  end
  
  def test_bi_annually
    rate = InterestRate.new(0.10)
    assert_in_delta 0.0488088481701, rate.bi_annualy, 0.0001
  end
  
  def test_monthly
    rate = InterestRate.new(0.10)
    assert_in_delta 0.00797411, rate.monthly, 0.0001
  end
  
  def test_add_new_time_period
    InterestRate.add_time_periods({:once_in_a_blue_moon => 3.41666666666667})
    rate = InterestRate.new(0.10)
    assert_not_nil rate.once_in_a_blue_moon
    rate2 = InterestRate.new(0.10)
    assert_not_nil rate.once_in_a_blue_moon
  end
end