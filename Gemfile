source 'https://rubygems.org'

gem 'rails', '~> 3.2.12'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails', '~> 2.0.0'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'
#gem 'passenger'

# Deploy with Capistrano
gem 'capistrano'

# To use debugger
# gem 'debugger'

gem 'exception_notification', :require => 'exception_notifier'

group :development, :test do
  gem 'mysql2'
  gem 'pg'
end

group :production do
  gem 'pg'
end

# Refinery CMS
gem 'refinerycms', '~> 2.0.0'

# Specify additional Refinery CMS Extensions here (all optional):
#gem 'refinerycms-i18n', '~> 2.0.0'
gem 'refinerycms-blog', '~> 2.0.0'
gem 'refinerycms-inquiries', '~> 2.0.0'
gem 'refinerycms-search', '~> 2.0.0'
gem 'refinerycms-page-images', '~> 2.0.0'

gem 'figaro'

gem 'refinerycms-waiting_families', :path => 'vendor/extensions'
gem 'refinerycms-waiting_kids', :path => 'vendor/extensions'

gem 'refinerycms-events', :path => 'vendor/extensions'
gem 'refinerycms-featured_items', :path => 'vendor/extensions'
gem 'refinerycms-staffs', :path => 'vendor/extensions'
gem 'refinerycms-carousel_images', :path => 'vendor/extensions'
