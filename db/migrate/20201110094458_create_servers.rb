class CreateServers < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.references :country, null: false, foreign_key: true
      t.string :ip
      t.string :username
      t.string :password
      t.boolean :premium, default: false

      t.timestamps
    end
  end
end
