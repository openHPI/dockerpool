class Container < ActiveRecord::Base
  belongs_to :consumer
  belongs_to :daemon
  belongs_to :pool
end
