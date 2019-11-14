# frozen_string_literal: true

class WebController < ApplicationController
  include RenderJson
  include Pagy::Backend
  include JsonExceptionHandler

  before_action :set_referrer, :authenticate_user!, :set_paper_trail_whodunnit

  def info_for_paper_trail
    { ip: request.remote_ip, user_agent: request.user_agent, company_id: current_user&.company&.id }
  end

  breadcrumb 'Dashboard', :root_path

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
