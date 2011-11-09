class License < ActiveRecord::Base
  has_many :servers

  belongs_to :client
  belongs_to :payment_gateway

  validates_numericality_of :client_id, :only_integer => true, :greater_than => 0
  validates_length_of :key, :is => 40
  validates_uniqueness_of :key

  def start_date_nice
    start_date.present? ?  start_date.strftime('%b %d, %y') : ''
  end

  def end_date_nice
    end_date.present? ?  end_date.strftime('%b %d, %y') : ''
  end

  def renewal_date_nice
    return renewal_date.strftime('%b %d, %y') if renewal_date.present?
    return (start_date.to_date + period).strftime('%b %d, %y') if start_date.present? and period.present?
    return ''
  end

  def name
    client.name_or_email
  end

  def self.check_expiry(key, email)
    key = (key || '').first(40)
    email ||= ''

    license = License.where(:key => key).first
    return true if license and license.expired

    client = Client.where(:email => email).first
    return true if client and client.expired

    clients = Client.where(:other_emails.matches => "%#{email}%").all
    return true if clients.size == 1 and clients.first.expired

    message = "Email #{email} matched with other_emails in more than two clients when checking for expired clients."
    clients.each do |c|
      msg = c.message.present? ? c.message + ' ' + message : message
      c.update_attributes(:message => msg, :flag => true)
    end
    return false
  end
end
