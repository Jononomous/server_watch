class FixLogEvents < ActiveRecord::Migration
  def change
    rename_column :log_events, :type, :error_type
  end
end
