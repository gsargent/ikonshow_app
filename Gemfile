source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  gem 'awesome_print'
  gem 'better_errors','0.7.2'
  gem 'binding_of_caller'
  # the rails-erd gem requires graphviz - which wouldn't install.
  # See rails-erd.rubyforge.org. Under install it lists:
  # $ sudo port install graphviz. This failed. Googling led to 'gdbm'.
  # I finally ran at the command prompt: $ sudo port uninstall  --follow-dependents graphviz
  #                                      $ sudo port clean gdbm
  #                                      $ sudo port install graphviz
  # and it ran to completion.
  gem 'rails-erd'
end

group :production do
  gem 'pg'        # installed for deployment to Heroku
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',     '~> 3.2.3'
  gem 'bootstrap-sass', ">= 2.3.0.0" #gfs
  gem 'coffee-rails',   '~> 3.2.2'
  gem 'uglifier',       '>= 1.2.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', '0.8.2', :require => false
end

gem 'devise', '~>2.2.3'
gem 'carrierwave'
gem 'cloudinary'
gem 'attachinary'
gem 'cancan'
gem 'rolify'
gem 'simple_form'
