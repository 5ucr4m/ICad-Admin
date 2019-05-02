# frozen_string_literal: true

class WebController < ApplicationController
  include RenderJson
  include Pagy::Backend
  include JsonExceptionHandler

  before_action :authenticate_user!
  before_action :set_referrer

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'application/json' }
      format.html do
        redirect_to @referrer, flash: { error: t('errors.forbidden') }
      end
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  private

  def set_referrer
    route = Rails.application.routes.recognize_path(request.referer)[:controller]
    @referrer = "#{route.presence || 'root'}_path"
  end
end
