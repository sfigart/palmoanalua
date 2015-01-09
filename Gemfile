source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '3.2.11'
gem 'json', '1.7.7'

group :development, :test do
  gem 'sqlite3'
  gem 'mysql2'
end
group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'rack-timeout'
end

group :assets do
  gem 'sass-rails',   '3.2.5'
  gem 'coffee-rails', '3.2.1'
  gem 'uglifier', '1.0.3'
end

gem 'jquery-rails', '2.1.3'
gem "thin", "1.5.0"
gem "haml", "3.1.7"
gem "haml-rails", "0.3.5", :group => :development
gem "hpricot", "0.8.6", :group => :development
gem "ruby_parser", "3.0.1", :group => :development
gem "bootstrap-sass", "2.2.1.1"
gem "devise", "2.1.2"
gem "devise_invitable", "1.1.2"
gem "cancan", "1.6.8"
gem "rolify", "3.2.0"
gem "simple_form", "2.0.4"
gem "quiet_assets", "1.0.1", :group => :development
gem "awesome_print", '1.1.0', :group => :development

# Stuff I added
gem 'validates_timeliness', '3.0.14'
gem 'attr_encrypted', '1.2.1'
# Required for IE to show header correct
gem 'modernizr-rails', '2.0.6'

# Stuff for Heroku
group :production do
  gem 'newrelic_rpm'
  gem 'google-analytics-rails'
  gem 'rails_12factor'
end