# -*- encoding: utf-8 -*-
# stub: capistrano-scm-gitcopy 0.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-scm-gitcopy".freeze
  s.version = "0.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jack Wu".freeze, "Carl Douglas".freeze]
  s.date = "2016-09-13"
  s.description = "Gitcopy strategy for capistrano 3.x".freeze
  s.email = ["xuwupeng2000@gmail.com".freeze]
  s.homepage = "https://github.com/xuwupeng2000/capsitrano-scm-gitcopy.git".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Gitcopy strategy for capistrano 3.x".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.1.0"])
    else
      s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.1.0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0.0"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.1.0"])
  end
end
