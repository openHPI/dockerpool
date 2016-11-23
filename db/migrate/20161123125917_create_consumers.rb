class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :name
      t.string :oauth_secret
      t.string :oauth_session_key
      t.datetime :oauth_session_expires

      t.timestamps null: false
    end
  end
end
