class ServerInfosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @server_info_list = ServerInfo.all
  end

  def new
    @server_info = ServerInfo.new
  end

  def edit
    @server_info = ServerInfo.find(params[:id])
  end

  def create
    @server_info = ServerInfo.new(params[:server_info])
    if @server_info.valid?
      ServerInfo.create(params[:server_info])
      redirect_to server_infos_path, flash: { notice: 'Server Information Created Successfully' }
    else
      render :new
    end
  end

  def update
    @server_info = ServerInfo.find(params[:id])
    if @server_info.update_attributes(params[:server_info])
      redirect_to server_infos_path, flash: { notice: 'Server Information Updated Successfully' }
    else
      render :edit
    end
  end

  def destroy
    ServerInfo.find(params[:id]).destroy
    redirect_to server_infos_path, flash: { notice: 'Server Information Deleted Successfully' }
  end
end
