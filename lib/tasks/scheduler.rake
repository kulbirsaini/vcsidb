#!/usr/bin/env ruby

desc "Archive server instances which are older than three days."
task :archive_servers => :environment do
  num_days = 2
  puts "Archiving servers older than #{num_days} days"
  count = Server.active.count
  Server.archive num_days
  puts "Archived #{count - Server.active.count} servers"

  num_days = 14
  puts "Deleting servers older than #{num_days} days"
  count = Server.unscoped.count
  Server.expire num_days
  puts "Deleted #{count - Server.unscoped.count} servers"
end
