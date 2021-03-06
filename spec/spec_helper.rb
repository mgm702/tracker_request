#require 'capybara/rspec'
require 'webmock/rspec'
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    stub_request(:any, /api.github.com/).to_rack(TestGitHub)
  end

  config.order = :random

  config.backtrace_exclusion_patterns << /\.rvm\/gems/
  # Print the 10 slowest examples and example groups at the
  # end of the spec run, to help surface which specs are running
  # particularly slow.
  #config.profile_examples = 10
end
