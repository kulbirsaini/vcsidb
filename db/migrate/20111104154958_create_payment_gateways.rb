class CreatePaymentGateways < ActiveRecord::Migration
  def change
    create_table :payment_gateways do |t|
      t.string :name
      t.string :website
      t.text :description
      t.boolean :disabled

      t.timestamps
    end
  end
end
