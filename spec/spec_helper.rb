RSpec.configure do |config|
  config.expect_with :rspec do |c|
    # Should syntax is deprecated
    # See: https://github.com/rspec/rspec-expectations/blob/master/Should.md
    # TODO: Upgrade should to expect syntax
    c.syntax = [:should, :expect]  # default, enables both `should` and `expect`
  end
end

require 'simplecov'
SimpleCov.start

require 'renum'
