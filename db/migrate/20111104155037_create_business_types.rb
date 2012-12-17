class CreateBusinessTypes < ActiveRecord::Migration
  def change
    create_table :business_types do |t|
      t.string :name
      t.text :description
      t.boolean :disabled

      t.timestamps
    end
  end
end
