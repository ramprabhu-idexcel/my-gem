#!/usr/bin/env rake
require 'bundler/setup'
require 'mygem'
require 'active_record_migrations'


ActiveRecordMigrations.configure do |c|
  # c.database_configuration = {
    # 'test' => YAML.load(File.read('config/database.yml'))
  # }
  # Other settings:
  c.schema_format = :sql # default is :ruby
  c.yaml_config = 'config/database.yml'
  c.environment = ENV['RAILS_ENV'] || 'test'
  c.db_dir = 'db'
  c.migrations_paths = ['db/migrate'] # the first entry will be used by the generator
end

ActiveRecord::Base.pluralize_table_names = false
ActiveRecord::Base.primary_key_prefix_type = :table_name_with_underscore
ActiveRecordMigrations.load_tasks
ActiveRecord::Base.dump_schema_after_migration = false

# Fake out an application environment so that migrations work
# task :rails_env do
  # require "erb"
  # require "rails"
  # require "rails/application"

  # ENV['RAILS_ENV'] = 'test'
  # Class.new(Rails::Application) unless Rails.application

  # ActiveRecord::Base.configurations = YAML.load(ERB.new(File.read('config/database.yml')).result)
  # ActiveRecord::Base.establish_connection(ENV['RAILS_ENV'])
  # ActiveRecord::Base.schema_format = :sql
  # ActiveRecord::Base.pluralize_table_names = false
  # ActiveRecord::Base.primary_key_prefix_type = :table_name_with_underscore
# end

# task :environment => :rails_env
# task "db:load_config" => :environment

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

load "active_record/railties/databases.rake"
# load 'active_record/connection_adapters/oracle_enhanced.rake'
# require 'active_support/core_ext/string/filters'
# require 'active_support/core_ext/string/access'
