#!/usr/bin/env ruby

desc "Archive server instances which are older than three days."
task :archive_servers => :environment do
  puts 'Archiving servers'
  count = Server.unscoped.count
  Server.archive
  puts "Archived #{count - Server.unscoped.count} servers"

  num_days = 30
  puts "Deleting servers older than #{num_days} days"
  count = Server.unscoped.count
  Server.expire num_days
  puts "Deleted #{count - Server.unscoped.count} servers"
  #License.update_renewal_dates
end
