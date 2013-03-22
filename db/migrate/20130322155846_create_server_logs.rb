class CreateServerLogs < ActiveRecord::Migration
  def change
    create_table :server_logs do |t|
      t.string :title
      t.string :log_path
      t.int :chk_frequency

      t.timestamps
    end
  end
end
