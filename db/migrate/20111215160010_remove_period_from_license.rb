class RemovePeriodFromLicense < ActiveRecord::Migration
  def up
    remove_column :licenses, :period
    remove_column :licenses, :end_date
    remove_column :licenses, :price
    remove_column :licenses, :paid
    remove_column :licenses, :payment_gateway_id
  end

  def down
    add_column :licenses, :payment_gateway_id, :integer
    add_column :licenses, :paid, :integer
    add_column :licenses, :price, :integer
    add_column :licenses, :end_date, :integer
    add_column :licenses, :period, :integer
  end
end
