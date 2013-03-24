class ServersController < ApplicationController

  def index
    @servers = ServerLog.all
  end

  def fetch_log
    server = ServerInfo.find(params[:server])
    log = ServerLog.find(params[:log])
    response = ''
    begin
      #Connect to the server, output and truncate the logfile
      Net::SSH.start(server.url, server.username, keys: [server.key_file.path], keys_only: true) do |ssh|
        response = ssh.exec!("cat #{log.log_path}")
        ssh.exec!("cat /dev/null > #{log.log_path}")
        parse_errors(response, server.id)
        flash[:notice] = 'Log successfully parsed'
      end
    rescue
      flash[:notice] = 'Connection to server failed.'
    end
    redirect_to servers_path
  end

  private

  def parse_errors(error_string, id)
    if !error_string.blank?
      error_string = error_string.split(/Started\s/)
      error_string.each do |str|
        type = str.match(/\s\d{3}\s/).to_s.strip
        title = str.match(/\w+::\w+/).to_s
        level = 0
        if ([type] & LogEvent::HIGHALERTS).present?
          level = 3
        end
        if ([type] & LogEvent::MEDIUMALERTS).present?
          level = 2
        end
        if ([type] & LogEvent::LOWALERTS).present?
          level = 1
        end
        if type != '200' && !type.match(/\d+/).nil?
          LogEvent.create(title: title, 
                          error_type: type, 
                          alert_level: level, 
                          occured_at: Time.now, 
                          server_log_id: id,
                          error_text: str)
        elsif !title.blank? && type.blank?
          LogEvent.create(title: title, 
                          error_type: '500', 
                          alert_level: 3, 
                          occured_at: Time.now, 
                          server_log_id: id,
                          error_text: str)
        end
      end
    end
  end
end
