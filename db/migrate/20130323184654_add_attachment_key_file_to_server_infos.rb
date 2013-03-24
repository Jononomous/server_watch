class AddAttachmentKeyFileToServerInfos < ActiveRecord::Migration
  def self.up
    change_table :server_infos do |t|
      t.attachment :key_file
    end
  end

  def self.down
    drop_attached_file :server_infos, :key_file
  end
end
