#!/usr/bin/env ruby

desc "Archive server instances which are older than three days."
task :cron => :environment do
  if Time.now.hour % 2 == 0
    Server.archive
  end

  if Time.now.hour % 6 == 0
    License.update_renewal_dates
  end
end
