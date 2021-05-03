# -*- encoding: utf-8 -*-
# stub: page_title_helper 5.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "page_title_helper".freeze
  s.version = "5.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Lukas Westermann".freeze]
  s.date = "2021-02-19"
  s.description = "Simple, internationalized and DRY page titles and headings for Rails.".freeze
  s.email = ["lukas.westermann@gmail.com".freeze]
  s.homepage = "https://github.com/lwe/page_title_helper".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.0.8".freeze
  s.summary = "Simple, internationalized and DRY page titles and headings for Rails.".freeze

  s.installed_by_version = "3.0.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2.0", "< 6.2"])
      s.add_development_dependency(%q<rake>.freeze, [">= 10.3.2"])
      s.add_development_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.82.0"])
      s.add_development_dependency(%q<rubocop-rails>.freeze, ["~> 2.5.2"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 5.2.0", "< 6.2"])
      s.add_dependency(%q<rake>.freeze, [">= 10.3.2"])
      s.add_dependency(%q<shoulda>.freeze, [">= 0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.82.0"])
      s.add_dependency(%q<rubocop-rails>.freeze, ["~> 2.5.2"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 5.2.0", "< 6.2"])
    s.add_dependency(%q<rake>.freeze, [">= 10.3.2"])
    s.add_dependency(%q<shoulda>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.82.0"])
    s.add_dependency(%q<rubocop-rails>.freeze, ["~> 2.5.2"])
  end
end
