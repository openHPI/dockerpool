class DaemonsController < ApplicationController
  before_action :set_daemon, only: [:show, :edit, :destroy]

  def index
    @daemons = Daemon.all
  end

  def create

  end

  def new
  end

  def show
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def set_daemon
    @daemon = Daemon.find(params[:id])
  end
end
