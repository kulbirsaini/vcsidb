class PaymentGateway < ActiveRecord::Base
  belongs_to :client
  belongs_to :license

  validates_presence_of :name
end
