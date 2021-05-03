# -*- encoding: utf-8 -*-
# stub: page_title_helper 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "page_title_helper".freeze
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lukas Westermann".freeze]
  s.date = "2012-04-11"
  s.description = "Simple, internationalized and DRY page titles and headings for rails.".freeze
  s.email = ["lukas.westermann@gmail.com".freeze]
  s.homepage = "http://github.com/lwe/page_title_helper".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7".freeze)
  s.rubygems_version = "2.7.5".freeze
  s.summary = "Simple, internationalized and DRY page titles and headings for Rails.".freeze

  s.installed_by_version = "2.7.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.0.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 3.0.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 3.0.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.2"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
  end
end
