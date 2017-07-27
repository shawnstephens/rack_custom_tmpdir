# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack_custom_tmpdir/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack_custom_tmpdir'
  spec.version       = RackCustomTmpdir::VERSION
  spec.authors       = ['winebarrel']
  spec.email         = ['sgwr_dts@yahoo.co.jp']

  spec.summary       = %q{Rack middleware to change temporary directory of file upload}
  spec.description   = %q{Rack middleware to change temporary directory of file upload}
  spec.homepage      = 'https://github.com/winebarrel/rack_custom_tmpdir'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'rack'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
