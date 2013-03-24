class AddServerInfoIdToServerLog < ActiveRecord::Migration
  def change
    add_column :server_logs, :server_info_id, :integer
  end
end
