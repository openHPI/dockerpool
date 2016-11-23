class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|
      t.string :docker_id
      t.datetime :blocked_since
      t.references :consumer, index: true, foreign_key: true
      t.integer :usages
      t.integer :runtime
      t.boolean :active

      t.timestamps null: false
    end
  end
end
