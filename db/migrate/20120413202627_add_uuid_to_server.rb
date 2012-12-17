class AddUuidToServer < ActiveRecord::Migration
  def change
    add_column :servers, :uuid, :string
  end
end
