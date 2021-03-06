# frozen_string_literal: true

require "bundler/setup"

require "simplecov"
require "coveralls"
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter "/spec"
end
Coveralls.wear!

require "vcr"
require "base64"

require "passivetotal"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def authorization_field
  username = ENV["PASSIVETOTAL_USERNAME"] || "foo"
  password = ENV["PASSIVETOTAL_API_KEY"] || "bar"
  token = "#{username}:#{password}"

  "Basic #{Base64.strict_encode64(token)}"
end

ENV["PASSIVETOTAL_USERNAME"] = "foo bar" unless ENV.key?("PASSIVETOTAL_USERNAME")
ENV["PASSIVETOTAL_API_KEY"] = "foo bar" unless ENV.key?("PASSIVETOTAL_API_KEY")

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data("<CENSORED>") { authorization_field }
  config.filter_sensitive_data("<CENSORED>") { ENV["PASSIVETOTAL_USERNAME"] }
  config.filter_sensitive_data("<CENSORED>") { ENV["PASSIVETOTAL_API_KEY"] }
end
