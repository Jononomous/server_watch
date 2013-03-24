class ServerLogsController < ApplicationController
  def index
    if params[:specific]
      @server_logs = ServerInfo.find(params[:specific]).server_logs
    else
      @server_logs = ServerLog.all
    end
  end

  def show
    @server_log = ServerLog.find(params[:id])
    @log_events = @server_log.log_events
  end
end
