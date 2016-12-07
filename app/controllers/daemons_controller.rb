class DaemonsController < ApplicationController
  before_action :set_daemon, only: [:show, :edit, :destroy]

  def index
    @daemons = Daemon.all
  end

  def create
    @daemon = Daemon.new(daemon_params)
    if @daemon.save
      redirect_to @daemon, flash: {notice: 'Daemon was created successfully'}
    else
      render :new
    end
  end

  def new
    @daemon = Daemon.new
  end

  def show

  end

  def edit

  end

  def update
    if @daemon.update_attributes(daemon_params)
      redirect_to :back, flash: {notice: 'Daemon was updated successfully!'}
    end
  end

  def destroy
    @daemon.destroy
    redirect_to :daemons, flash: {notice: 'Daemon was removed successfully!'}
  end

  private
  def set_daemon
    @daemon = Daemon.find(params[:id])
  end

  def daemon_params
    params.require(:daemon).permit(:port,:ip)
  end
end
