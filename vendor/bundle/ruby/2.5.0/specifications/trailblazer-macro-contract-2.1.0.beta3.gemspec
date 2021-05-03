# -*- encoding: utf-8 -*-
# stub: trailblazer-macro-contract 2.1.0.beta3 ruby lib

Gem::Specification.new do |s|
  s.name = "trailblazer-macro-contract".freeze
  s.version = "2.1.0.beta3"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nick Sutterer".freeze]
  s.date = "2018-03-23"
  s.description = "Trailblazer operation macros to integrate Reform".freeze
  s.email = ["apotonick@gmail.com".freeze]
  s.homepage = "http://trailblazer.to".freeze
  s.licenses = ["LGPL-3.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0".freeze)
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Trailblazer operation macros to integrate Reform forms and DRY.rb schemas.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<declarative>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<reform>.freeze, ["< 3.0.0", ">= 2.2.0"])
      s.add_runtime_dependency(%q<trailblazer-operation>.freeze, ["< 0.3.0", ">= 0.2.4"])
      s.add_development_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_development_dependency(%q<trailblazer-macro>.freeze, ["< 2.2.0", ">= 2.1.0.beta2"])
      s.add_development_dependency(%q<reform-rails>.freeze, [">= 0"])
      s.add_development_dependency(%q<dry-validation>.freeze, [">= 0"])
      s.add_development_dependency(%q<activemodel>.freeze, [">= 0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<roar>.freeze, [">= 0"])
      s.add_development_dependency(%q<multi_json>.freeze, [">= 0"])
    else
      s.add_dependency(%q<declarative>.freeze, [">= 0"])
      s.add_dependency(%q<reform>.freeze, ["< 3.0.0", ">= 2.2.0"])
      s.add_dependency(%q<trailblazer-operation>.freeze, ["< 0.3.0", ">= 0.2.4"])
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<trailblazer-macro>.freeze, ["< 2.2.0", ">= 2.1.0.beta2"])
      s.add_dependency(%q<reform-rails>.freeze, [">= 0"])
      s.add_dependency(%q<dry-validation>.freeze, [">= 0"])
      s.add_dependency(%q<activemodel>.freeze, [">= 0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<roar>.freeze, [">= 0"])
      s.add_dependency(%q<multi_json>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<declarative>.freeze, [">= 0"])
    s.add_dependency(%q<reform>.freeze, ["< 3.0.0", ">= 2.2.0"])
    s.add_dependency(%q<trailblazer-operation>.freeze, ["< 0.3.0", ">= 0.2.4"])
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<trailblazer-macro>.freeze, ["< 2.2.0", ">= 2.1.0.beta2"])
    s.add_dependency(%q<reform-rails>.freeze, [">= 0"])
    s.add_dependency(%q<dry-validation>.freeze, [">= 0"])
    s.add_dependency(%q<activemodel>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<roar>.freeze, [">= 0"])
    s.add_dependency(%q<multi_json>.freeze, [">= 0"])
  end
end
