source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'active_decorator'
gem 'active_interaction'
gem 'devise'
gem 'devise-i18n'
gem 'enumerize'
gem 'faraday'
gem 'jbuilder', '~> 2.5'
gem 'jp_prefecture'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'uglifier'

# assets
gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'font-awesome-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'sass-rails'

group :development do
  gem 'annotate'
  gem 'letter_opener_web'
  gem 'listen'
  gem 'railroady'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara'
  gem 'database_rewinder'
  gem 'fuubar'
  gem 'poltergeist'
  gem 'stripe-ruby-mock', '~> 2.4.0', require: 'stripe_mock'
  gem 'timecop'
end

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'gimei'
  gem 'i18n-debug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'webmock' # or webmock  gem 'bullet'
end

group :production do
  gem 'pg'
end
