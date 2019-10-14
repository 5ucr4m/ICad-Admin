# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true, if: :verify_api
  # protect_from_forgery with: :exception, if: :verify_api
  before_action :set_company

  protected

  def verify_api
    params[:controller].split('/')[0] != 'devise_token_auth'
  end

  def set_company
    return unless user_signed_in?

    RailsMultitenant::GlobalContextRegistry[:company_id] = current_user.company.id
  end
end
