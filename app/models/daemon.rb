class Daemon < ActiveRecord::Base
  belongs_to :pool
  def address
    ip + ':' + port
  end
end
