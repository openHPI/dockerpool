class AddPoolRefToContainers < ActiveRecord::Migration
  def change
    add_reference :containers, :pool, index: true, foreign_key: true
  end
end
