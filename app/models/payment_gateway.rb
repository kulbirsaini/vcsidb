class PaymentGateway < ActiveRecord::Base
  has_many :clients
  has_many :payments

  validates_presence_of :name
end
