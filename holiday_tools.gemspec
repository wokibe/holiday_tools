# -*- encoding: utf-8 -*-
require File.expand_path('../lib/holiday_tools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["kittekat"]
  gem.email         = ["wolfkibe@gmail.com"]
  gem.description   = %q{List regions of public holidays}
  gem.summary       = %q{Select date, period and regions for public holidays}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "holiday_tools"
  gem.require_paths = ["lib"]
  gem.version       = HolidayTools::VERSION
  
  gem.add_dependency 'holidays'
  gem.add_development_dependency 'rspec', '~> 2.7'
end
