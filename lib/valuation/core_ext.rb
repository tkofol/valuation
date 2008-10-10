class Array
  def sum
    inject(0){|s,v|s+v}
  end
end