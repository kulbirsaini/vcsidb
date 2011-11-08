class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :email
      t.integer :license_id
      t.integer :client_id
      t.string :version
      t.string :revision
      t.boolean :trial
      t.text :macs
      t.text :ips
      t.string :python
      t.string :squid
      t.string :os_name
      t.string :os_id
      t.string :os_version
      t.string :system
      t.string :arch
      t.text :other

      t.timestamps
    end
  end
end
