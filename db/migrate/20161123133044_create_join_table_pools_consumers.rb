class CreateJoinTablePoolsConsumers < ActiveRecord::Migration
  def change
    create_join_table :pools, :consumers do |t|
      t.index [:pool_id, :consumer_id]
      t.index [:consumer_id, :pool_id]
    end
  end
end
