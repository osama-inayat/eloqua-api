require 'bundler/setup'
require 'webmock/rspec'
require 'json'
require 'constants/constants'
require 'constants/eloqua_endpoints'
require 'constants/mock_request_helper'
require 'rspec_junit_formatter'

Dir[File.join(__dir__, 'webmocks', '*.rb')].each { |file| require file } # rubocop: disable all

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
