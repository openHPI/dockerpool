class AddNetworkEnabledToPools < ActiveRecord::Migration
  def change
    add_column :pools, :network_enabled, :boolean
  end
end
