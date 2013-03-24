class ServerInfo < ActiveRecord::Base
  attr_accessible :name, :password, :ssh_key, :url, :user_id, :username, :server_logs_attributes, :key_file

  belongs_to :user
  has_many :server_logs, dependent: :destroy
  accepts_nested_attributes_for :server_logs, reject_if: :all_blank, allow_destroy: true
  has_attached_file :key_file

  validates :name, :url, :username, presence: true

  def get_key
    self.key_file.path.split('/').last
  end
end
