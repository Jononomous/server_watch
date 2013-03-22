class LogEvent < ActiveRecord::Base
  attr_accessible :alert_level, :occured_at, :server_log_id, :title, :type

  belongs_to :server_log
end
