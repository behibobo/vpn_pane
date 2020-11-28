class CreateConnections < ActiveRecord::Migration[6.0]
  def change
    create_table :connections do |t|
      t.references :server, null: false, foreign_key: true
      t.string :ip
      t.string :serial_number
      t.references :account, null: true, foreign_key: true

      t.timestamps
    end
  end
end
