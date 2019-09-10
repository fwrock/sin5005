# Load the Rails application.
require_relative 'application'

ENV['DATABASE_CLEANER_ALLOW_PRODUCTION'] = 'true'
ENV['DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL'] = 'true'

# Initialize the Rails application.
Rails.application.initialize!

