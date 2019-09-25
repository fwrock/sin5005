
DatabaseCleaner.clean_with(:deletion) # clean once, now
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.allow_production = true
DatabaseCleaner.allow_remote_database_url = true
Cucumber::Rails::Database.javascript_strategy = :deletion