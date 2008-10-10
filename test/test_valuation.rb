require File.dirname(__FILE__) + '/test_helper.rb'
include Valuation

class TestValuation < Test::Unit::TestCase
  
  def test_perpetuity
    assert_in_delta 20.0, perpetuity(20, 1), 0.01
    assert_in_delta 20.0, perpetuity(20.0, 1), 0.01
    assert_in_delta 200.0, perpetuity(20, 0.1), 0.01
  end
  
  def test_growing_prepetuity
    assert_in_delta 20.0, perpetuity(20, 2, 1), 0.01
    assert_in_delta 200.0, perpetuity(20, 0.5, 0.4), 0.01
  end
  
  def test_present_value_annuity
    assert_in_delta 31698.654, annuity(10000, 0.10, 4) , 0.01
  end
  
  def test_present_value_growing_annuity
    assert_in_delta 52.6971, annuity(10, 0.10, 7, :g => 0.03), 0.01
  end
  
  def test_future_value_annuity
    assert_in_delta 46410.0, annuity(10000, 0.10, 4, :pv => false), 0.01
  end
  
  def test_future_value_growing_annuity
    assert_in_delta 102.69, annuity(10, 0.10, 7, :g => 0.03, :pv => false), 0.01
  end
  
  def test_npv
    assert_in_delta 24.86965, npv([0,10,10, 10], 0.10), 0.01
  end
end
