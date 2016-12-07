class Consumer < ActiveRecord::Base
  has_secure_token :oauth_session_key

  def create_new_session
    self.regenerate_oauth_session_key
    self.oauth_session_expires = DateTime.now + 3.weeks
    self.save!
  end

  def session_expired?
    self.oauth_session_expires < DateTime.now
  end
end
