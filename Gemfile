source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.3.4'
gem 'rails', '~> 5.2.0.rc2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors', require: 'rack/cors'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
