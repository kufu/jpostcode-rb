# -*- encoding: utf-8 -*-
# stub: rubocop-rake 0.6.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rubocop-rake".freeze
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/rubocop/rubocop-rake/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/rubocop/rubocop-rake", "source_code_uri" => "https://github.com/rubocop/rubocop-rake" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Masataka Pocke Kuwabara".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-06-28"
  s.description = "A RuboCop plugin for Rake".freeze
  s.email = ["kuwabara@pocke.me".freeze]
  s.homepage = "https://github.com/rubocop/rubocop-rake".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0".freeze)
  s.rubygems_version = "3.3.27".freeze
  s.summary = "A RuboCop plugin for Rake".freeze

  s.installed_by_version = "3.3.27" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 1.0"])
  else
    s.add_dependency(%q<rubocop>.freeze, ["~> 1.0"])
  end
end
