# -*- encoding: utf-8 -*-
# stub: trailblazer-compat 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "trailblazer-compat".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sutterer".freeze]
  s.date = "2017-08-09"
  s.description = "Use Trailblazer 1.1 and 2.x in one application.".freeze
  s.email = ["apotonick@gmail.com".freeze]
  s.homepage = "http://trailblazer.to".freeze
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Use Trailblazer 1.1 and 2.x.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trailblazer>.freeze, ["~> 2.0"])
      s.add_runtime_dependency(%q<uber>.freeze, ["~> 0.0.15"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    else
      s.add_dependency(%q<trailblazer>.freeze, ["~> 2.0"])
      s.add_dependency(%q<uber>.freeze, ["~> 0.0.15"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    end
  else
    s.add_dependency(%q<trailblazer>.freeze, ["~> 2.0"])
    s.add_dependency(%q<uber>.freeze, ["~> 0.0.15"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
