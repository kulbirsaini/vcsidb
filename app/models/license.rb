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
end
