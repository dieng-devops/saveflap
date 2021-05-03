# -*- encoding: utf-8 -*-
# stub: with_env 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "with_env".freeze
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Zach Dennis".freeze]
  s.bindir = "exe".freeze
  s.date = "2015-07-15"
  s.description = "\n    WithEnv is an extremely small helper module for executing code with ENV variables. It exists because\n    I got tired of re-writing or copying over a #with_env helper method for the 131st time.\n  ".freeze
  s.email = ["zach.dennis@gmail.com".freeze]
  s.homepage = "https://github.com/mhs/with_env-rb".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "WithEnv is an extremely small helper module for executing code with ENV variables.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
  end
end
