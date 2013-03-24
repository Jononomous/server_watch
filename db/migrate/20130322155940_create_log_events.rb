class CreateLogEvents < ActiveRecord::Migration
  def change
    create_table :log_events do |t|
      t.string :title
      t.string :type
      t.integer :server_log_id
      t.integer :alert_level
      t.datetime :occured_at

      t.timestamps
    end
  end
end
