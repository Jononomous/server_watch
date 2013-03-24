class AddErrorTextToLogEvent < ActiveRecord::Migration
  def change
    add_column :log_events, :error_text, :text
  end
end
