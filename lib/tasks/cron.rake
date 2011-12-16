#!/usr/bin/env ruby

desc "Archive server instances which are older than three days."
task :cron => :environment do
  if Time.now.hour % 2 == 0
    Server.where{{ updated_at.lte => 3.days.ago }}.each{ |s| s.update_attributes( :archived => true ) }
  end
end
