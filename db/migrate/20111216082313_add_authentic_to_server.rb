class AddAuthenticToServer < ActiveRecord::Migration
  def change
    add_column :servers, :authentic, :boolean, :default => false
  end
end
