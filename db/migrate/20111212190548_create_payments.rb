class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :license_id
      t.datetime :date
      t.integer :period
      t.integer :price
      t.integer :paid
      t.integer :payment_gateway_id
      t.text :notes

      t.timestamps
    end
  end
end
