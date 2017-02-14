class Container < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :daemon
  belongs_to :pool

  def active_containers
    where(active: true)
  end
end
