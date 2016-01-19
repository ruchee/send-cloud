lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'send-cloud/version'

Gem::Specification.new do |spec|
  spec.name          = 'send-cloud'
  spec.version       = SendCloud::VERSION
  spec.authors       = ['Ruchee']
  spec.email         = ['my@ruchee.com']
  spec.description   = %q{ruby client for sohu send-cloud api}
  spec.summary       = %q{use this gem to call sohu send-cloud api}
  spec.homepage      = 'https://github.com/ruchee/send-cloud'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client'
  spec.add_dependency 'logging', '~> 2.0'

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
