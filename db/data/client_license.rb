#!/usr/bin/env ruby

file_path = (Rails.root + 'db/migrate/base_client_license_data.txt').to_path

data = YAML.load(File.read(file_path))

data.each do |l| 
  c = Client.create({ :name => l[:c][:name], :email => l[:c][:email], :expired => l[:c][:expired], :other_emails => l[:c][:other_emails] })
  c.licenses.create({ :key => l[:l][:key], :start_date => l[:l][:start_date], :trial => l[:l][:trial], :expired => l[:l][:expired] })
end

