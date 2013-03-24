class ServerLog < ActiveRecord::Base
  attr_accessible :chk_frequency, :log_path, :title

  has_many :log_events, dependent: :destroy
  belongs_to :server_info

  validates :log_path, :title, presence: true
  validates :chk_frequency, numericality: { greater_than: 0 }

  def low_alerts
    self.log_events.where(alert_level: 1)
  end

  def medium_alerts
    self.log_events.where(alert_level: 2)
  end

  def high_alerts
    self.log_events.where(alert_level: 3)
  end
end
