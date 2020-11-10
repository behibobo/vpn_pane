class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.string :country
      t.string :flag
      t.string :ip
      t.string :username
      t.string :password
      t.boolean :premium, default: false

      t.timestamps
    end
  end
end
