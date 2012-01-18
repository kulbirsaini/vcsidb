#!/usr/bin/env ruby

desc "Archive server instances which are older than three days."
task :archive_servers => :environment do
  puts 'Archiving servers'
  count = Server.count
  Server.archive
  puts "Archived #{count - Server.count} servers"

  #License.update_renewal_dates
end
