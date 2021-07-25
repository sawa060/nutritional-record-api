source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'rails', '~> 6.1.0'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'

gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise', '4.7.3'
gem 'devise_token_auth'
gem 'rack-cors'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'

  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false

  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'faker_japanese'
  gem 'bullet'
  gem 'pdf-reader'
end

group :development do
  gem 'listen', '~> 3.3'

  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
