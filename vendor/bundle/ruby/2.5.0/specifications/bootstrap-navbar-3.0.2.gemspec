# -*- encoding: utf-8 -*-
# stub: bootstrap-navbar 3.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-navbar".freeze
  s.version = "3.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Manuel Meurer".freeze]
  s.date = "2018-02-14"
  s.description = "Helpers to generate a Bootstrap style navbar".freeze
  s.email = "manuel@krautcomputing.com".freeze
  s.homepage = "http://bootstrap-ruby.github.io/bootstrap-navbar".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "Helpers to generate a Bootstrap style navbar".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-html-matchers>.freeze, ["~> 0.6"])
      s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.2"])
      s.add_development_dependency(%q<padrino-helpers>.freeze, ["~> 0.13.3"])
      s.add_development_dependency(%q<bootstrap-sass>.freeze, ["= 3.0.2.0"])
      s.add_development_dependency(%q<bootstrap>.freeze, ["= 4.0.0.alpha6"])
      s.add_runtime_dependency(%q<gem_config>.freeze, ["~> 0.3"])
    else
      s.add_dependency(%q<rake>.freeze, [">= 0.9"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-html-matchers>.freeze, ["~> 0.6"])
      s.add_dependency(%q<guard-rspec>.freeze, ["~> 4.2"])
      s.add_dependency(%q<padrino-helpers>.freeze, ["~> 0.13.3"])
      s.add_dependency(%q<bootstrap-sass>.freeze, ["= 3.0.2.0"])
      s.add_dependency(%q<bootstrap>.freeze, ["= 4.0.0.alpha6"])
      s.add_dependency(%q<gem_config>.freeze, ["~> 0.3"])
    end
  else
    s.add_dependency(%q<rake>.freeze, [">= 0.9"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-html-matchers>.freeze, ["~> 0.6"])
    s.add_dependency(%q<guard-rspec>.freeze, ["~> 4.2"])
    s.add_dependency(%q<padrino-helpers>.freeze, ["~> 0.13.3"])
    s.add_dependency(%q<bootstrap-sass>.freeze, ["= 3.0.2.0"])
    s.add_dependency(%q<bootstrap>.freeze, ["= 4.0.0.alpha6"])
    s.add_dependency(%q<gem_config>.freeze, ["~> 0.3"])
  end
end
