require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

# TODO remove when warning is fixed
require 'minitest/autorun'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'webmock/rspec'
require 'shoulda/matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false

  # config.include Formulaic::Dsl, type: :feature
  config.include Features, type: :feature
  config.include CapybaraHelper, type: :feature
  config.include Devise::TestHelpers, type: :controller
  config.include Records
end

# Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)


