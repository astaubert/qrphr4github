source 'https://rubygems.org'
ruby "2.0.0"

# gem 'rails', '3.2.13'
# Changed Rails to 4.0.0 in order to support Heroku

gem 'rails', '4.0.0'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'

gem 'pg'

# Added for Heroku support, see: https://devcenter.heroku.com/articles/getting-started-with-rails4

gem 'rails_12factor', group: :production

# removed asset group and gems, according to: http://railscasts.com/episodes/415-upgrading-to-rails-4?view=asciicast

gem 'sass-rails',   '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0.rc1'
gem 'uglifier', '>= 1.3.0'

gem 'zurb-foundation'

gem 'jquery-rails'

# added to fix potential problem in Heroku with missing openssl - see app/models/aes.rb

# gem "rubysl-openssl", "~> 2.0.0"

# added for migration to rails4.0 based on: http://railscasts.com/episodes/342-migrating-to-postgresql?view=asciicast

gem 'protected_attributes'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
gem 'activerecord-deprecated_finders'

# added for heroku, based on: http://stackoverflow.com/questions/16862855/rails-app-fails-on-heroku-no-route-matches-get

group :production do
  # gem 'pg' # dont want sqlite in production
  gem 'unicorn' # make sure you follow installation instructions for this gem
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

gem 'turbolinks' 

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
