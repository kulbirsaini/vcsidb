class Server < ActiveRecord::Base
  has_one :parent, :through => :client

  belongs_to :license
  belongs_to :client

  scope :active, where("archived IS NULL OR archived = ?", false)
  scope :pirated, where(:authentic => false)

  default_scope :order => 'updated_at DESC'
  default_scope where("archived IS NULL OR archived = ?", false)

  def licensee_email
    license.try(:client).try(:email)
  end

  def licensee_name
    license.try(:client).try(:name_or_email)
  end

  def licensee_full_name
    license.try(:client).try(:name)
  end

  def client_email
    client.try(:email)
  end

  def client_name
    client.try(:name_or_email)
  end

  def client_full_name
    client.try(:name)
  end

  def license_valid?
    return false if license.nil? or license.try(:expired) or license.try(:client).try(:expired) or client.try(:expired)
    return true if licensee_email == client_email
    return true if email =~ /^sisland_/
    return true if email =~ /@sequreisp.com$/
    return false
  end

  def self.archive(num_days = 4)
    Server.active.where("updated_at <= ?", num_days.days.ago).each{ |s| s.update_attributes( :archived => true ) }
  end

  def self.expire(num_days = 14)
    server_count = Server.unscoped.where("updated_at <= ?", num_days.days.ago).select(:id).count
    Server.unscoped.where("updated_at <= ?", num_days.days.ago).find_in_batches(:batch_size => 500) do |servers|
      puts "Deleting #{servers.count} servers"
      servers.each do |server|
        server.destroy
      end
    end
    puts "Total Deleted Servers : #{server_count}"
  end
end
