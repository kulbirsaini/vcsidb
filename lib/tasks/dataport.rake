namespace :dataport do
  desc "Export Client/License data to YAML"
  task :export, [:needs] => [:environment] do
    licenses = []
    License.all.each do |l|
      licenses << { :client_id=> l.client.email, :key=> l.key, :start_date=> l.start_date, :end_date=> l.end_date, :period=> l.period, :renewal_date=> l.renewal_date, :trial=> l.trial, :expired=> l.expired, :num_servers=> l.num_servers, :price=> l.price, :paid=> l.paid, :payment_gateway_id=>l.payment_gateway_id, :notes=> l.notes, :renewal_reminders=> l.renewal_reminders }
    end
    clients = []
    Client.all.each do |c|
      clients << { :name=> c.name, :email=> c.email, :company=> c.company, :business_type_id=>c.business_type_id, :city=>c.city, :state=>c.state, :country_id=>c.country_id, :other_emails=>c.other_emails, :payment_gateway_id=>c.payment_gateway_id, :expired=>c.expired, :reseller=>c.reseller, :parent_id=>c.parent_id, :notes=> c.notes, :flag=>c.flag, :message=> c.message}
    end

    file = File.open(Rails.root + 'db/data/client_licenses.data', 'w')
    file.write([clients, licenses].to_yaml)
    file.close()
  end

  desc "Import Client/License data from disk"
  task :import, [:needs] => [:environment] do
    clients, licenses = YAML.load(File.read(Rails.root + 'db/data/client_licenses.data'))
    Client.delete_all
    License.delete_all
    clients.each do |c|
      client = Client.where(:email => c[:email]).first
      if client
        client.update_attributes(c)
      else
        Client.create(c)
      end
    end

    licenses.each do |l|
      client = Client.where(:email => l[:client_id]).first
      if client
        l.delete(:client_id)
        client.licenses.create(l)
      else
        puts "No client found with email #{l[:client_id]}"
      end
    end
  end
end
