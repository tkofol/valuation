require File.dirname(__FILE__) + '/test_helper.rb'
include Valuation

class TestInterestRate < Test::Unit::TestCase
  
  def test_yearly
    rate = InterestRate.new(0.10)
    assert_in_delta 0.10, rate.yearly, 0.0001
  end
  
  def test_bi_annually
    rate = InterestRate.new(0.10)
    assert_in_delta 0.0488088481701, rate.bi_annually, 0.0001
  end
  
  def test_monthly
    rate = InterestRate.new(0.10)
    assert_in_delta 0.00797411, rate.monthly, 0.0001
  end
  
  def test_add_monthly_rate
    rate = InterestRate.new(0.01, :monthly)
    assert_in_delta 0.12682503013197, rate.yearly, 0.0001
  end
  
  def test_add_new_time_period
    InterestRate.add_time_periods({:once_in_a_blue_moon => 3.41666666666667})
    rate = InterestRate.new(0.10)
    assert_not_nil rate.once_in_a_blue_moon
    rate2 = InterestRate.new(0.10)
    assert_not_nil rate.once_in_a_blue_moon
  end
  
  def test_apr_monthly
    rate = InterestRate.new(0.12, :apr, :compounded => :monthly)
    assert_in_delta 0.01, rate.monthly, 0.0001
    assert_in_delta 0.12682503013197, rate.rate, 0.0001
  end
  
  def test_apr_semi_annually
    rate = InterestRate.new(0.12, :apr, :compounded => :semiannually)
    assert_in_delta 0.06, rate.semiannually, 0.0001
  end
  
  def test_continuous_interest_rate
    rate = InterestRate.new(0.05)
    assert_in_delta 0.28402, rate.continuous(5), 0.0001
  end
  
  def test_custom_interest_rate
    rate = InterestRate.new(0.05, (1/3.0))
    assert_in_delta 0.157625, rate.rate, 0.0001
  end
end