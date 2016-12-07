class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]
  def index
    @pools = Pool.all
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      redirect_to @pool, flash: {notice: 'Pool was created successfully'}
    else
      render :new
    end
  end

  def new
    @pool = Pool.new
  end

  def show

  end

  def edit

  end

  def update
    if @pool.update_attributes(pool_params)
      redirect_to :back, flash: {notice: 'Pool was updated successfully!'}
    end
  end

  def destroy
    @pool.destroy
    redirect_to :pools, flash: {notice: 'Pool was removed successfully!'}
  end

  private
  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:min,:max,:max_runtime,:max_usage,:image)
  end
end
