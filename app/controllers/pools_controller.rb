class PoolsController < ApplicationController
  before_action :set_pool, only: [:show, :edit, :update, :destroy]
  def index
    @pools = Pool.all
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      redirect_to @pool, notice: 'Pool was created successfully'
    else
      render :new
    end
  end

  def new
  end

  def show

  end

  def edit

  end

  def update
    if @pool.update_attributes(pool_params)
      redirect_to :back, notice: 'Pool was updated successfully!'
    end
  end

  def destroy

  end

  private
  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:min,:max,:max_runtime,:max_usage,:image)
  end
end
