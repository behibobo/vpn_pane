class AddPingToServers < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :ping, :integer, default:0
  end
end
