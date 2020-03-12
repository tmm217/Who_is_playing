source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'activeadmin', '2.2.0'
gem 'bcrypt'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'devise'
gem 'http'
gem 'jbuilder', '~> 2.7'
gem "puma", ">= 3.12.3"
gem "nokogiri", ">= 1.10.8"
gem 'rails', '~> 6.0.0'
gem 'sprockets', '< 4'
gem 'sassc-rails'
gem 'webpacker', '~> 4.0'
gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'grade_runner', github: 'firstdraft/grade_runner'
  gem 'pry-rails'
  gem 'sqlite3', '~> 1.4'
  gem 'table_print'
  gem 'web_git', github: 'firstdraft/web_git'
end

group :development do
  gem 'annotate', '< 3.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'draft_generators', github: 'firstdraft/draft_generators', branch: 'winter-2020'
  gem 'letter_opener'
  gem 'meta_request'
end

group :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-html-matchers'
  gem 'rspec-rails'
  gem 'webmock'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
