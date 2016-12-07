class AddDaemonIdToPools < ActiveRecord::Migration
  def change
    add_reference :pools, :daemon, index: true, foreign_key: true
  end
end
