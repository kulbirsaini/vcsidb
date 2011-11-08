class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :company
      t.integer :business_type_id
      t.string :city
      t.string :state
      t.integer :country_id
      t.string :other_emails
      t.integer :payment_gateway_id
      t.boolean :expired
      t.boolean :reseller
      t.integer :parent_id
      t.text :notes
      t.boolean :flag
      t.text :message

      t.timestamps
    end
  end
end
