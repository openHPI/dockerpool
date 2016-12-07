class PoolsController < ApplicationController
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

  def destroy

  end

  private
  def set_pool
    @pool = Pool.find(params[:id])
  end
end
