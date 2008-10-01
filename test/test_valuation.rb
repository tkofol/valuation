require File.dirname(__FILE__) + '/test_helper.rb'
include Valuation

class TestRubyValuation < Test::Unit::TestCase

  def setup
  end
  
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
end
