class ServerLog < ActiveRecord::Base
  attr_accessible :chk_frequency, :log_path, :title

  has_many :log_events, dependent: :destroy
end
