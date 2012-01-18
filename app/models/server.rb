class Server < ActiveRecord::Base
  has_one :parent, :through => :client

  belongs_to :license
  belongs_to :client

  scope :active, where{{ archived.in => [false, nil] }}
  scope :pirated, where{{ authentic => false }}

  default_scope :order => 'updated_at DESC'
  default_scope where{{ archived.in => [false, nil] }}

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

  def self.archive
    Server.where{{ updated_at.lte => 3.days.ago }}.each{ |s| s.update_attributes( :archived => true ) }
  end

  def self.expire(num_days = 14)
    Server.where{{ updated_at.lte => num_days.days.ago }}.each{ |s| s.destroy }
  end
end
