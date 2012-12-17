class License < ActiveRecord::Base
  has_many :servers
  has_many :payments

  belongs_to :client

  validates_numericality_of :client_id, :only_integer => true, :greater_than => 0
  validates_length_of :key, :is => 40
  validates_uniqueness_of :key

  scope :active, where("expired IS NULL OR expired = ?", false)
  default_scope :order => 'created_at DESC'

  def name
    client.name_or_email
  end

  def self.check_expiry(key, email)
    key = (key || '').first(40)
    email = (email || '').downcase

    license = License.where(:key => key).first
    return license.expired if license

    return false unless email.present?

    c = Client.where(:email => email).first
    return c.expired if c

    clients = Client.where("other_emails LIKE ?", "%#{email}%").all
    return clients.first.expired if clients.size == 1

    message = "Email #{email} matched with other_emails in more than two clients when checking for expired clients."
    clients.each do |c|
      msg = c.message.present? ? c.message + ' ' + message : message
      c.update_attributes(:message => msg, :flag => true)
    end
    return false
  end

  def self.update_renewal_dates
    License.all.each do |l|
      p = Payment.unscoped.where(:license_id => l.id).order(:date).last
      l.update_attributes( :renewal_date => l.start_date.to_date + p.period ) if p and l.start_date.present? and p.period.present?
    end
  end
end
