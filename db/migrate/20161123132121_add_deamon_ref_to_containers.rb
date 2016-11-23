class AddDeamonRefToContainers < ActiveRecord::Migration
  def change
    add_reference :containers, :deamon, index: true, foreign_key: true
  end
end
