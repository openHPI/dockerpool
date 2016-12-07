class Pool < ActiveRecord::Base
  def name
    image + ':' + id
  end
end
