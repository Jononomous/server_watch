class ServerInfo < ActiveRecord::Base
  attr_accessible :name, :password, :ssh_key, :url, :user_id, :username
end
