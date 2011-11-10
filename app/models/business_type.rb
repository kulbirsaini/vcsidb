class BusinessType < ActiveRecord::Base
  belongs_to :client

  validates_presence_of :name
end
