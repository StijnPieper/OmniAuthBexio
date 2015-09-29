# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/bexio/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-bexio"
  gem.version       = Omniauth::Bexio::VERSION
  gem.authors       = ["Igor Springer"]
  gem.email         = ["springerigor@gmail.com"]

  gem.summary       = %q{OmniAuth for Bexio}
  gem.description   = %q{Unoficial OmniAuth strategy for Bexio}
  gem.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if gem.respond_to?(:metadata)
    gem.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  gem.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.bindir        = "exe"
  gem.executables   = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-oauth2'

  gem.add_development_dependency "bundler", "~> 1.10"
  gem.add_development_dependency "rake", "~> 10.0"
end
