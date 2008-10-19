Gem::Specification.new do |s|
  s.name = %q{valuation}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new("= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Kofol"]
  s.date = %q{2008-10-19}
  s.description = %q{A Ruby Gem For Corporate Finance Calculations.}
  s.email = %q{tkofol@gmail.com}
  s.extra_rdoc_files = ["lib/valuation/cash_flows.rb", "lib/valuation/core_ext.rb", "lib/valuation/interest_rate.rb", "lib/valuation.rb", "README.textile"]
  s.files = ["History.txt", "lib/valuation/cash_flows.rb", "lib/valuation/core_ext.rb", "lib/valuation/interest_rate.rb", "lib/valuation.rb", "License.txt", "Manifest", "Rakefile", "README.textile", "test/test_cash_flows.rb", "test/test_helper.rb", "test/test_interest_rate.rb", "test/test_valuation.rb", "valuation.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Valuation", "--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{valuation}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{A Ruby Gem For Corporate Finance Calculations.}
  s.test_files = ["test/test_cash_flows.rb", "test/test_helper.rb", "test/test_interest_rate.rb", "test/test_valuation.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
