class AddArchivedToServer < ActiveRecord::Migration
  def change
    add_column :servers, :archived, :boolean
  end
end
