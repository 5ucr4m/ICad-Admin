# frozen_string_literal: true

module Api
  class ApiController < ApplicationController
    include RenderJson
    include JsonExceptionHandler
    include DeviseTokenAuth::Concerns::SetUserByToken

    before_action :authenticate_user!

    respond_to :json

    rescue_from CanCan::AccessDenied do |_exception|
      respond_to do |format|
        format.json { head :unauthorized, content_type: 'application/json' }
      end
    end
  end
end
