require 'rails/generators'
require 'rails/generators/migration'

class ArMailerRails3Generator < Rails::Generators::NamedBase
  include Rails::Generators::Migration
  
  def create_ar_mailer_files
    self.class.check_class_collision class_name
    template('ar_mailer.rb', 'config/initializers/ar_mailer.rb')
    template('model.rb', File.join('app/models', class_path, "#{file_name}.rb"))
    migration_template 'migration.rb', "db/migrate/create_#{file_path.gsub(/\//, '_').pluralize}.rb"
  end
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
  
  # Implement the required interface for Rails::Generators::Migration.
  # taken from http://github.com/rails/rails/blob/master/activerecord/lib/generators/active_record.rb
  def self.next_migration_number(dirname)
    if ActiveRecord::Base.timestamped_migrations
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    else
     "%.3d" % (current_migration_number(dirname) + 1)
   end
  end
  
  def self.banner
    "Usage: #{$0} ar_mailer_rails3 EmailModelName (default: Email)"
  end  
end
