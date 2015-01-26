# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ff2csv/version'

Gem::Specification.new do |spec|
  spec.name          = "ff2csv"
  spec.version       = Ff2csv::VERSION
  spec.authors       = ["James Punnett"]
  spec.email         = ["james.punnett@cibcfcib.com"]
  spec.description   = %q{ff2csv converts fixed-length-records to Comma Separated Values (CSV) format.}
  spec.summary       = %q{Use ff2csv to review DAT files that an iSeries program generates. Converting it to CSV makes it easy to analyze the data, easier to share and easier to import into other tools (a DB, Excel, etc)}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency('rdoc')
  spec.add_development_dependency('aruba')
  spec.add_development_dependency('rake', '~> 0.9.2')
  spec.add_dependency('methadone', '~> 1.3.0')
end
