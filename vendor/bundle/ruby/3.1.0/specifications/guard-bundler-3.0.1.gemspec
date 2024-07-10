# -*- encoding: utf-8 -*-
# stub: guard-bundler 3.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "guard-bundler".freeze
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Yann Lugrin".freeze]
  s.date = "2023-01-27"
  s.description = "Guard::Bundler automatically install/update your gem bundle when needed".freeze
  s.email = ["yann.lugrin@sans-savoir.net".freeze]
  s.homepage = "https://rubygems.org/gems/guard-bundler".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.9".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "Guard gem for Bundler".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<guard>.freeze, ["~> 2.2"])
    s.add_runtime_dependency(%q<guard-compat>.freeze, ["~> 1.1"])
    s.add_runtime_dependency(%q<bundler>.freeze, [">= 2.1", "< 3"])
  else
    s.add_dependency(%q<guard>.freeze, ["~> 2.2"])
    s.add_dependency(%q<guard-compat>.freeze, ["~> 1.1"])
    s.add_dependency(%q<bundler>.freeze, [">= 2.1", "< 3"])
  end
end
