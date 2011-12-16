class Server < ActiveRecord::Base
  belongs_to :license
  belongs_to :client

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
    return true if licensee_email == client_email
    return true if email =~ /^sisland_/
    return true if email =~ /@sequreisp.com$/
    return false
  end
end
