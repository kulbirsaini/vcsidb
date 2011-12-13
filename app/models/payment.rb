class Payment < ActiveRecord::Base
  belongs_to :license
  belongs_to :payment_gateway

  def start_date_nice
    date.present? ? date.strftime('%b %d, %y') : ''
  end

  def name
    license.try(:client).try(:name_or_email)
  end
end
