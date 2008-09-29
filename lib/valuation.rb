module Valuation
  
  def perpetuity(a, r)
    a / r.to_f
  end
  
  def growing_perpetuity(a, r, g)
    a / (r-g).to_f
  end
end