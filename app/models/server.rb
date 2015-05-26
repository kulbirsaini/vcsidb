class Server < ActiveRecord::Base
  has_one :parent, :through => :client

  belongs_to :license
  belongs_to :client

  scope :active, where("`servers`.archived IS NULL OR `servers`.archived = ?", false)
  scope :pirated, where(:authentic => false)

  default_scope :order => '"servers".updated_at DESC'
  default_scope where("`servers`.archived IS NULL OR `servers`.archived = ?", false)

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

  def self.active_since(since = 1.days.ago)
    active.where("`servers`.updated_at >= ?", since.to_time)
  end

  def license_valid?
    return false if license.nil? or license.try(:expired) or license.try(:client).try(:expired) or client.try(:expired)
    return true if licensee_email == client_email
    return true if email =~ /^sisland_/
    return true if email =~ /@sequreisp.com$/
    return false
  end

  def self.archive(num_days = 4)
    Server.active.where("`servers`.updated_at <= ?", num_days.days.ago).each{ |s| s.update_attributes( :archived => true ) }
  end

  def self.expire(num_days = 14)
    Server.unscoped.where("`servers`.updated_at <= ?", num_days.days.ago).find_in_batches(:batch_size => 500) do |servers|
      servers.each do |server|
        server.destroy
      end
    end
  end
end
