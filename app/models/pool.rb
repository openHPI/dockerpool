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
  def available_container_count
    containers.where(active: true).count
  end
end
