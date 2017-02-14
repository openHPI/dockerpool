class Pool < ActiveRecord::Base
  belongs_to :daemon
  has_many :containers

  validates :image, presence: true, length: {minimum: 1}
  validates :min, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1}
  validates_numericality_of :max, :greater_than => Proc.new { |r| r.min }
  validates :max_runtime, numericality: { only_integer:  true, greater_than_or_equal_to: 0}
  validates :max_usages, numericality: { only_integer:  true, greater_than_or_equal_to: 0}
  validates :daemon_id, presence: true

  def name
    image + ':' + id.to_s
  end
  def active_container_count
    containers.where(active: true).count
  end
  def active_containers
    containers.where(active: true)
  end
  def available_containers
    containers.where(active: true, blocked_since: nil)
  end
  def unavailable_containers
    containers.where('active = TRUE and blocked_since <> NULL')
  end
  def destroyed_containers
    containers.where(active: false)
  end
  def uncreated_containers_left
    max - active_container_count
  end
  def can_create_container
    (uncreated_containers_left > 0)
  end
end
