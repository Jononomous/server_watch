class ServerInfo < ActiveRecord::Base
  attr_accessible :name, :password, :ssh_key, :url, :user_id, :username

  belongs_to :user
  has_many :server_logs, dependent: :destroy

end
