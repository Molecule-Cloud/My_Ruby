# frozen_string_literal: true

# spec/spec_helper.rb

require 'rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end
  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end
  config.order = :random
end
