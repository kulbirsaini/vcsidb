class Client < ActiveRecord::Base
  has_many :licenses
  has_many :payments, :through => :licenses
  has_many :servers
  has_many :children, :class_name => 'Client', :foreign_key => 'parent_id'

  belongs_to :parent, :class_name => 'Client'
  belongs_to :country
  belongs_to :business_type
  belongs_to :payment_gateway

  scope :active, where("\"clients\".expired IS NULL OR \"clients\".expired = ?", false)
  scope :expired, where(:expired => true)
  scope :reseller, where(:reseller => true)
  scope :independent, where(:parent_id => nil)

  default_scope :order => '"clients".created_at DESC'

  validates_uniqueness_of :email
  validates_presence_of :email

  def self.select_list
    Client.where("\"clients\".email NOT LIKE 'sisland_%' AND \"clients\".email NOT LIKE '%@sequreisp.com'")
  end

  def all_servers
    (servers + licenses.map{ |l| l.servers }.flatten).uniq
  end

  def all_emails
    [email, other_emails].select{ |i| i.present? }.join(',').split(',').map(&:strip).select{ |i| i.present? }.join(', ')
  end

  def city_state
    return "#{city.titleize}, #{state.titleize}" if city.present? and state.present?
    city || state
  end

  def name_or_email
    return name if name.present?
    return email if email.present?
    "Incosistent Database"
  end

  def name_with_email
    return email unless name.present?
    return "#{name} (#{email})"
  end

  def append_email(value)
    ((other_emails || '').split(', ') + [value]).join(', ')
  end

  def self.find_or_create(email, license_key)
    email ||= ''
    email.downcase!

    license_key ||= ''
    license_key.downcase!

    client = Client.where(:email => email).first
    return client if client

    # Create client with reseller as parent if client belongs to a reseller
    reseller_email = nil
    if email =~ SISLAND_REGEX
      reseller_email = SISLAND_CLIENT_EMAIL
    elsif email =~ SEQURE_REGEX
      reseller_email = SEQURE_CLIENT_EMAIL
    end

    if reseller_email
      reseller = Client.where(:email => reseller_email).first
      return Client.create(:email => email, :parent_id => reseller.id) if reseller
    end

    # Locate email in client.other_emails
    clients = Client.where("\"clients\".other_emails LIKE ?", "%#{email}%").all
    if clients.size > 0
      return clients.first if clients.size == 1

      # If email matches with other_emails of more than one client, then check with license to verify
      license = License.where(:key => license_key).first
      if license and license.client
        clients.each do |c|
          return c if license.client.other_emails =~ email
        end
      end

      # Scary situation
      return Client.create(:email => email, :flag => true, :message => 'Client email set is matching with other_emails of more than one client.')
    end

    # If client is using a different email than registered
    license ||= License.where(:key => license_key).first
    if license and license.client
      client = license.client
      return Client.create(:email => email, :notes => "client_email : #{client.email} other_emails : #{client.other_emails} license : #{license.key}")
    else
      # If it's a totally new client, then we have no option!
      return Client.create(:email => email)
    end
  end
end

