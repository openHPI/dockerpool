class Api::AuthController < ApplicationController
  def create
    auth_method = params.require 'grant_type'
    id = params.require 'client_id'
    secret = params.require 'client_secret'
    status = 200
    session = nil

    if auth_method == 'client_credentials'
      status = 401
    end

    consumer = Consumer.find_by_oauth_key(id)
    if consumer.nil? or consumer.oauth_secret != secret
      status = 401
    else
      consumer.create_new_session

      session = {
          :access_token => consumer.oauth_session_key,
          :expires_in => consumer.oauth_session_expires,
          :token_type => 'session_token'
      }
    end

    render :json => session, :status => status
  end
end
