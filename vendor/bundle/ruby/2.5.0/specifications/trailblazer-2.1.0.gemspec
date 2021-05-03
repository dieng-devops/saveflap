# -*- encoding: utf-8 -*-
# stub: trailblazer 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "trailblazer".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sutterer".freeze]
  s.date = "2019-09-23"
  s.description = "A high-level architecture introducing new abstractions such as operations and control flow, form objects and policies.".freeze
  s.email = ["apotonick@gmail.com".freeze]
  s.homepage = "http://trailblazer.to".freeze
  s.licenses = ["LGPL-3.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "A high-level architecture for Ruby and Rails.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<trailblazer-macro>.freeze, [">= 2.1.0", "< 2.2.0"])
      s.add_runtime_dependency(%q<trailblazer-macro-contract>.freeze, [">= 2.1.0", "< 2.2.0"])
      s.add_runtime_dependency(%q<trailblazer-operation>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    else
      s.add_dependency(%q<trailblazer-macro>.freeze, [">= 2.1.0", "< 2.2.0"])
      s.add_dependency(%q<trailblazer-macro-contract>.freeze, [">= 2.1.0", "< 2.2.0"])
      s.add_dependency(%q<trailblazer-operation>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<trailblazer-macro>.freeze, [">= 2.1.0", "< 2.2.0"])
    s.add_dependency(%q<trailblazer-macro-contract>.freeze, [">= 2.1.0", "< 2.2.0"])
    s.add_dependency(%q<trailblazer-operation>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end
