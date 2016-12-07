class RemovePoolIdFromDaemons < ActiveRecord::Migration
  def change
    remove_foreign_key :daemons, column: :pool_id
  end
end
