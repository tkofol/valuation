module Valuation
  
  def perpetuity(c, i, g=0)
    c / (i-g).to_f
  end
  
  def annuity(c, i, n)
    c * (1/i) * (1 - (1/(1+i)) ** n)
  end
  
end