require 'rubygems'
require 'rake'

begin
  require 'echoe'

  Echoe.new('valuation') do |p|
    p.version      = '0.0.1'
    p.author       = "Tim Kofol"
    p.email        = "tkofol@gmail.com"
    p.summary      = "A Ruby Gem For Corporate Finance."
  end

rescue LoadError => boom
  puts "You are missing a dependency required for meta-operations on this gem."
  puts "#{boom.to_s.capitalize}."
end


