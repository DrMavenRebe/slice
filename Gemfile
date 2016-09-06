source 'http://rubygems.org'

ruby '2.3.1'

gem 'annotate'
gem 'unicorn'
gem 'rails', '~> 4.2.0'
gem 'sinatra', :require => nil
gem 'figaro', '~> 1.1'
gem 'pg'
gem 'visual-environments'
gem 'haml-rails', '0.8.2'
gem 'simple_form'
gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'
gem 'jquery-rails'
gem 'sidetiq', git: 'git://github.com/tobiassvn/sidetiq.git', ref: '4f7d7daea3873443b17bf2f3da61619532bbeba2'
gem 'sidekiq-status', '~> 0.5.0'
gem 'sidekiq-middleware'
gem 'sidekiq-failures'
gem 'sidekiq-throttler'
gem 'sidekiq'
gem 'redis'
gem 'rabl'
gem 'highcharts-rails'
gem 'dalli'
gem 'memcachier'
gem 'puma'
gem 'puma-heroku'

# gem 'omniauth-fitbit'
# gem 'fitgem_oauth2'

gem 'devise'


gem 'omniauth-fitbit-oauth2'
gem 'fitgem_oauth2', '~>1.0.0'

group :production do
  gem 'newrelic_rpm'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry-byebug'

  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'webrat'
  gem 'database_cleaner'
end

group :development do
  gem 'meta_request', '~> 0.2.1', :require => 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
end
