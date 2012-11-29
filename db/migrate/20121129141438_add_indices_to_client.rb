class AddIndicesToClient < ActiveRecord::Migration
  def change
    add_index :clients, :reseller
    add_index :clients, :parent_id
    add_index :clients, :created_at
  end
end
