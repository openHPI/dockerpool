class AddExposedPortsToPools < ActiveRecord::Migration
  def change
    add_column :pools, :exposed_ports, :string
  end
end
