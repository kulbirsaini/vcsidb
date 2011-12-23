#!/usr/bin/env ruby

desc "Archive server instances which are older than three days."
task :archive_servers => :environment do
  if Time.now.hour % 2 == 0
    puts 'Archiving servers'
    count = Server.count
    Server.archive
    puts "Archived #{count - Server.count} servers"
  end

  #if Time.now.hour % 6 == 0
  #  #License.update_renewal_dates
  #end
end
