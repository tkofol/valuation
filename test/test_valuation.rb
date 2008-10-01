require File.dirname(__FILE__) + '/test_helper.rb'
include Valuation

class TestValuation < Test::Unit::TestCase
  
  def test_perpetuity
    assert 20, perpetuity(20, 1)
    assert 20, perpetuity(20.0, 1)
    assert 200, perpetuity(20, 0.1)
  end
  
  def test_growing_prepetuity
    assert 20, perpetuity(20, 2, 1)
    assert 20, perpetuity(20, 0.5, 0.4)
  end
  
  def test_present_value_annuity
    assert 31698, annuity(10000, 0.10, 4) 
  end
  
  def test_present_value_growing_annuity
    assert 53.84, annuity(10, 0.10, 7, :g => 0.03)
  end
  
  def test_future_value_annuity
    assert 46410, annuity(10000, 0.10, 4, :pv => false)
  end
  
  def test_future_value_growing_annuity
    assert 102.69, annuity(10, 0.10, 7, :g => 0.03, :pv => false)
  end
end
