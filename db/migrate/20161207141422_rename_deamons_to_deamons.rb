class RenameDeamonsToDeamons < ActiveRecord::Migration
  def change
    rename_table :deamons, :daemons
  end
end
