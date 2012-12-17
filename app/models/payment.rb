class Payment < ActiveRecord::Base
  has_one :client, :through => :license

  belongs_to :license
  belongs_to :payment_gateway

  def name
    license.try(:client).try(:name_or_email)
  end

  def name_with_email
    license.try(:client).try(:name_with_email)
  end
end
