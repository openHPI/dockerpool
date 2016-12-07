class Api::ContainersController < ApplicationController
  before_action :authenticate

  def create
    # This should return a container session.
  end

  def destroy
    # This should destroy the container session
  end

  private
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @consumer = Consumer.find_by_oauth_session_key(token)
    end
  end
end
