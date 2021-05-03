# -*- encoding: utf-8 -*-
# stub: trailblazer-activity 0.5.2 ruby lib

Gem::Specification.new do |s|
  s.name = "trailblazer-activity".freeze
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sutterer".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-03-23"
  s.description = "The main element for Trailblazer's BPMN-compliant workflows. Used in Trailblazer's Operation to implement the Railway.".freeze
  s.email = ["apotonick@gmail.com".freeze]
  s.homepage = "http://trailblazer.to/gems/workflow".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "The main element for Trailblazer's BPMN-compliant workflows.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hirb>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<trailblazer-context>.freeze, [">= 0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<trailblazer-test>.freeze, [">= 0"])
    else
      s.add_dependency(%q<hirb>.freeze, [">= 0"])
      s.add_dependency(%q<trailblazer-context>.freeze, [">= 0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<trailblazer-test>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<hirb>.freeze, [">= 0"])
    s.add_dependency(%q<trailblazer-context>.freeze, [">= 0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.14"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<trailblazer-test>.freeze, [">= 0"])
  end
end
