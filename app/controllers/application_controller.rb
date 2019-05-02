# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: :verify_api

  protected

  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end
end
