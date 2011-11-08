#!/usr/bin/env ruby

payment_gateways = [
  { :name => 'PayPal', :description => 'PayPal is one of the most popular e-commerce payment gateways used by our clients.', :website => 'https://www.paypal.com/' },
  { :name => 'Moneybookers', :description => 'Moneybookers is popular among European clients.', :website => 'http://moneybookers.com/' },
  { :name => 'Western Union', :description => 'If PayPal or Moneybookers is not available in your country, you can use Western Union to make the payment. It generally takes 2-3 working days to process payments made via Western Union.', :website => 'http://www.westernunion.com/' },
  { :name => 'Wired Transfer/Direct Bank Transfer/Telegraphic Transfer', :description => 'Payments can also be made using a Direct Bank Transfer to our company account. It takes 4-5 working days to process payments made via Direct Bank Transfer.', :website => 'http://en.wikipedia.org/wiki/Wire_transfer' },
]

PaymentGateway.create( payment_gateways )
