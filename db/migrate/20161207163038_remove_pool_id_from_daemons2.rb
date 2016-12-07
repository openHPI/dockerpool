class RemovePoolIdFromDaemons2 < ActiveRecord::Migration
  def change
    remove_column :daemons, :pool_id
  end
end
