class RenameDeamonIdToDaemonId < ActiveRecord::Migration
  def change
    rename_column :containers, :deamon_id, :daemon_id
  end
end
