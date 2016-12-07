class AddMemoryLimitToPools < ActiveRecord::Migration
  def change
    add_column :pools, :memory_limit, :integer
  end
end
