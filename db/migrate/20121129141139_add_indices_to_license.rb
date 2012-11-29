class AddIndicesToLicense < ActiveRecord::Migration
  def change
    add_index :licenses, :client_id
    add_index :licenses, :trial
    add_index :licenses, :expired
    add_index :licenses, :created_at
    add_index :licenses, :key
  end
end
