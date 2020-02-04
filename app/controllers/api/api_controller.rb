# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    include Pundit
    include RenderJson
    include JsonExceptionHandler
    include DeviseTokenAuth::Concerns::SetUserByToken

    before_action :authenticate_user!, :set_paper_trail_whodunnit

    def info_for_paper_trail
      { ip: request.remote_ip, user_agent: request.user_agent }
    end

    respond_to :json

    rescue_from Pundit::NotAuthorizedError do |_exception|
      respond_to do |format|
        format.json { head :unauthorized, content_type: 'application/json' }
      end
    end
  end
end
