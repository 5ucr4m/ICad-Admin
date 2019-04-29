# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, if: :devise_token_auth_controller?
  skip_before_action :verify_authenticity_token, if: :devise_token_auth_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_referrer

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'application/json' }
      format.html do
        redirect_to root_path, flash: { error: t('errors.forbidden') }
      end
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def set_referrer
    route = Rails.application.routes.recognize_path(request.referer)[:controller]
    @referrer = "#{route.presence || 'root'}_path"
  end

  def devise_token_auth_controller?
    params[:controller].split('/')[0] != 'devise_token_auth'
  end

  def devise_controllers?
    devise_token_auth_controller? || devise_controller?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[cns email password password_confirmation provider])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[cns email password])
  end
end
