ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.expect_with(:rspec) do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end

  config.mock_with :rspec
  config.use_transactional_fixtures = true
end

def sign_in_user(user=nil)
  @user = user || FactoryGirl.create(:user)
  sign_in @user
end