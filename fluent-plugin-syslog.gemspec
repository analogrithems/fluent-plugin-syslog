# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-syslog"
  spec.version       = "0.1.1"
  spec.authors       = ["Aaron Collins"]
  spec.email         = ["aaron.collins@hiremya.com"]

  spec.summary       = %q{Fluentd output plugin}
  spec.description   = %q{Fluentd syslog output plugin}
  spec.homepage      = "https://github.com/analogrithems/fluent-plugin-syslog"
  spec.license       = "Apache-2.0"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "fluentd", '>= 1.2', '< 2'
  spec.add_dependency "yajl-ruby", '>= 1.3.1'

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "test-unit", "~> 3.2"
end
