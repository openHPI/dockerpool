class Daemon < ActiveRecord::Base
  has_many :containers
  has_many :pools

  validates :ip, presence: true
  validates :port, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 65535, greater_than_or_equal_to:  1 }

  def address
    ip + ':' + port.to_s
  end
  def container_count
    containers.count
  end
  def blocked_container_count
    containers.where.not(consumer_id: nil).count
  end
  def removed_container_count
    containers.where(active: false).count
  end
end
