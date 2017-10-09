source 'http://rubygems.org'

gem 'rake', '< 11'
gem 'rdoc', '~> 4.2.2' # This is to support Ruby 1.8 and 1.9

group :development do
  # Travis simulator - faster + no more waiting for build emails<Paste>
  gem 'wwtd', '~> 1.3.0'
  gem 'cucumber', '~> 2.4.0'
  gem 'appraisal', '~> 2.2.0'
end

group :test do
  gem 'rspec', '>= 3'
  gem 'capybara', '~> 2.0'
  gem 'launchy', '~> 2.4.3'
  gem 'sqlite3', '~> 1.3.4'
  gem 'addressable', '~> 2.3.7'
  gem 'nokogiri', '~> 1.3.3'
end

gemspec
