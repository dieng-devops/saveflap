# -*- encoding: utf-8 -*-
# stub: license_finder 5.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "license_finder".freeze
  s.version = "5.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ryan Collins".freeze, "Vikram Yadav".freeze, "Daniil Kouznetsov".freeze, "Andy Shen".freeze, "Shane Lattanzio".freeze, "Li Sheng Tai".freeze, "Vlad vassilovski".freeze, "Jacob Maine".freeze, "Matthew Kane Parker".freeze, "Ian Lesperance".freeze, "David Edwards".freeze, "Paul Meskers".freeze, "Brent Wheeldon".freeze, "Trevor John".freeze, "David Tengdin".freeze, "William Ramsey".freeze, "David Dening".freeze, "Geoff Pleiss".freeze, "Mike Chinigo".freeze, "Mike Dalessio".freeze]
  s.date = "2018-04-02"
  s.description = "    LicenseFinder works with your package managers to find\n    dependencies, detect the licenses of the packages in them, compare\n    those licenses against a user-defined whitelist, and give you an\n    actionable exception report.\n".freeze
  s.email = ["labs-commoncode@pivotal.io".freeze]
  s.executables = ["license_finder".freeze, "license_finder_pip.py".freeze]
  s.files = ["bin/license_finder".freeze, "bin/license_finder_pip.py".freeze]
  s.homepage = "https://github.com/pivotal/LicenseFinder".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Audit the OSS licenses of your application's dependencies.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<httparty>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<thor>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<toml>.freeze, ["= 0.2.0"])
      s.add_runtime_dependency(%q<with_env>.freeze, ["= 1.1.0"])
      s.add_runtime_dependency(%q<xml-simple>.freeze, [">= 0"])
      s.add_development_dependency(%q<addressable>.freeze, ["= 2.5.2"])
      s.add_development_dependency(%q<capybara>.freeze, ["~> 2.0.0"])
      s.add_development_dependency(%q<fakefs>.freeze, ["~> 0.11.3"])
      s.add_development_dependency(%q<mime-types>.freeze, ["= 3.1"])
      s.add_development_dependency(%q<pry>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 1.13"])
      s.add_development_dependency(%q<rack>.freeze, ["> 1.6"])
      s.add_development_dependency(%q<rack-test>.freeze, ["> 0.7"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 0"])
      s.add_dependency(%q<httparty>.freeze, [">= 0"])
      s.add_dependency(%q<rubyzip>.freeze, [">= 0"])
      s.add_dependency(%q<thor>.freeze, [">= 0"])
      s.add_dependency(%q<toml>.freeze, ["= 0.2.0"])
      s.add_dependency(%q<with_env>.freeze, ["= 1.1.0"])
      s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
      s.add_dependency(%q<addressable>.freeze, ["= 2.5.2"])
      s.add_dependency(%q<capybara>.freeze, ["~> 2.0.0"])
      s.add_dependency(%q<fakefs>.freeze, ["~> 0.11.3"])
      s.add_dependency(%q<mime-types>.freeze, ["= 3.1"])
      s.add_dependency(%q<pry>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 1.13"])
      s.add_dependency(%q<rack>.freeze, ["> 1.6"])
      s.add_dependency(%q<rack-test>.freeze, ["> 0.7"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 0"])
    s.add_dependency(%q<httparty>.freeze, [">= 0"])
    s.add_dependency(%q<rubyzip>.freeze, [">= 0"])
    s.add_dependency(%q<thor>.freeze, [">= 0"])
    s.add_dependency(%q<toml>.freeze, ["= 0.2.0"])
    s.add_dependency(%q<with_env>.freeze, ["= 1.1.0"])
    s.add_dependency(%q<xml-simple>.freeze, [">= 0"])
    s.add_dependency(%q<addressable>.freeze, ["= 2.5.2"])
    s.add_dependency(%q<capybara>.freeze, ["~> 2.0.0"])
    s.add_dependency(%q<fakefs>.freeze, ["~> 0.11.3"])
    s.add_dependency(%q<mime-types>.freeze, ["= 3.1"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 1.13"])
    s.add_dependency(%q<rack>.freeze, ["> 1.6"])
    s.add_dependency(%q<rack-test>.freeze, ["> 0.7"])
  end
end
