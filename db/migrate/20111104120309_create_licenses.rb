class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :client_id
      t.string :key
      t.datetime :start_date
      t.datetime :end_date
      t.integer :period
      t.datetime :renewal_date
      t.boolean :trial
      t.boolean :expired
      t.integer :num_servers
      t.float :price
      t.float :paid
      t.integer :payment_gateway_id
      t.text :notes
      t.integer :renewal_reminders

      t.timestamps
    end
  end
end
