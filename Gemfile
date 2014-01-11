source 'https://rubygems.org'

gem 'rails', '4.0.2'
gem 'pg'
gem 'foreman'
gem 'unicorn'

gem 'sass-rails', '~> 4.0.0'
gem 'haml-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'quiet_assets'
gem 'faker'
gem 'foursquare2'
gem 'kaminari'
gem 'fb_graph'

#Bootstrap
gem 'therubyracer', platforms: :ruby
gem 'less-rails'
gem 'twitter-bootstrap-rails', github: 'seyhunak/twitter-bootstrap-rails', branch: 'bootstrap3'
gem 'simple_form', git: 'https://github.com/plataformatec/simple_form.git'

#User Authentication
gem 'devise'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'erb2haml'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'simplecov', :require=>false
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'fuubar'
  gem "factory_girl_rails"
  gem 'database_cleaner'
end
