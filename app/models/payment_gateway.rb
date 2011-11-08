class PaymentGateway < ActiveRecord::Base
  belongs_to :client
  belongs_to :license
end
