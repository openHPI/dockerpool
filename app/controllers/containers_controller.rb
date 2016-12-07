class ContainersController < ApplicationController
  before_action :set_container, only: [:destroy, :show]
  def index
    @containers = Container.all
  end
  def destroy
    @container.destroy
    redirect_to :containers, flash: {notice: 'Container was destroyed successfully!'}
  end
  def show
  end
  private
  def set_container
    @container = Container.find(params[:id])
  end
end
