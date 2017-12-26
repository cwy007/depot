# 可以通过 rake --tasks 查看可用的 rake 指令
namespace :db do
  desc "Prints the migrated versions"
  task schema_migrations: :environment do |t|
    puts ActiveRecord::Base.connection.select_values( 'select version from schema_migrations order by version' )
  end
end
