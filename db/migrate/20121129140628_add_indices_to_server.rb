class AddIndicesToServer < ActiveRecord::Migration
  def change
    add_index :servers, :license_id
    add_index :servers, :archived
    add_index :servers, :client_id
    add_index :servers, :trial
    add_index :servers, :authentic
    add_index :servers, :updated_at
  end
end
