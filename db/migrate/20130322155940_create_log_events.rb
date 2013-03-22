class CreateLogEvents < ActiveRecord::Migration
  def change
    create_table :log_events do |t|
      t.string :title
      t.string :type
      t.int :server_log_id
      t.int :alert_level
      t.datetime :occured_at

      t.timestamps
    end
  end
end
