# frozen_string_literal: true

class WebController < ApplicationController
  include RenderJson
  include Pagy::Backend
  include JsonExceptionHandler

  before_action :set_referrer, :authenticate_user!

  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'application/json' }
      format.html do
        redirect_to send(@referrer), flash: { error: t('errors.messages.forbidden') }
      end
      format.js { head :forbidden, content_type: 'text/html' }
    end
  end

  def user
    current_user
  end

  private

  def set_referrer
    @referrer = "#{request.referer.presence || 'root'}_path"
  end
end
