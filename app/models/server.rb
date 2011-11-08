class Server < ActiveRecord::Base
  belongs_to :license
  belongs_to :client

  def licensee_email
    license.try(:client).try(:email)
  end

  def licensee_name
    (license.try(:client).try(:name_or_email) || '').first(MAX_NAME_LENGTH)
  end

  def licensee_full_name
    license.try(:client).try(:name)
  end

  def client_email
    client.try(:email)
  end

  def client_name
    (client.try(:name_or_email) || '').first(MAX_NAME_LENGTH)
  end

  def client_full_name
    client.try(:name)
  end
end
