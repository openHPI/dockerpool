class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :image
      t.integer :min
      t.integer :max
      t.integer :max_runtime
      t.integer :max_usages

      t.timestamps null: false
    end
  end
end
