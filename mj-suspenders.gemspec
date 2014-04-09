# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'suspenders/version'
require 'date'

Gem::Specification.new do |s|
  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency 'bundler', '~> 1.6'
  s.add_dependency 'rails', '4.1.0'
  s.add_development_dependency 'aruba', '~> 0.5.2'
  s.add_development_dependency 'cucumber', '~> 1.2'
  s.authors = ['thoughtbot', 'Marcelo Jacobus']
  s.date = Date.today.strftime('%Y-%m-%d')

  s.description = <<-HERE
MJ-Suspenders is a base Rails project used by the author of this gem.
  HERE

  s.email = 'marcelo.jacobus@gmail.com'
  s.executables = ['mj-suspenders']
  s.extra_rdoc_files = %w[README.md LICENSE]
  s.files = `git ls-files`.split("\n")
  s.homepage = 'http://github.com/mjacobus/mg-suspenders'
  s.license = 'MIT'
  s.name = 'mj-suspenders'
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']
  s.summary = "Generate a Rails app using thoughtbot's best practices. Plus Marcelo Jacobus favorites"
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.version = Suspenders::VERSION
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov', '~> 0.7.1'
  s.add_development_dependency 'capybara'
end
