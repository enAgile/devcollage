source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3'
gem 'active_decorator'
gem 'active_interaction'
gem 'devise'
gem 'devise-i18n'
gem 'enumerize'
gem 'faraday'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'puma', '~> 3.7'
gem 'uglifier'

# assets
gem 'sass-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'owlcarousel2'
gem 'font-awesome-rails'
gem 'bootstrap-sass'
gem 'animate.css-rails'
gem 'waypoints-rails'
gem 'coffee-rails'

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
  gem 'stripe-ruby-mock', '~> 2.4.0', :require => 'stripe_mock'
  gem 'timecop'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'webmock' # or webmock  gem 'bullet'
  gem 'gimei'
  gem 'i18n-debug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-power_assert'
  gem 'rspec-rails'
  gem 'vcr_cable'
end
