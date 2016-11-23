class CreateDeamons < ActiveRecord::Migration
  def change
    create_table :deamons do |t|
      t.string :ip
      t.integer :port
      t.references :pool, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
