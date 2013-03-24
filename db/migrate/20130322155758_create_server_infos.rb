class CreateServerInfos < ActiveRecord::Migration
  def change
    create_table :server_infos do |t|
      t.integer :user_id
      t.string :name
      t.string :url
      t.string :username
      t.string :password
      t.string :ssh_key

      t.timestamps
    end
  end
end
