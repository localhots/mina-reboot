# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/reboot/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-reboot"
  spec.version       = MinaReboot::VERSION
  spec.authors       = ["Gregory Eremin"]
  spec.email         = ["g@erem.in"]
  spec.summary       = %q{Generates cron @reboot task from Mina deploy config}
  spec.description   = %q{Generates cron @reboot task every time you deploy with Mina, so your app will start automatically in case of server reboot}
  spec.homepage      = "https://github.com/localhots/mina_reboot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = []
  spec.test_files    = []
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
