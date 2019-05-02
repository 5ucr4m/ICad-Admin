module Api
  module Overrides
    class SessionsController < ::DeviseTokenAuth::SessionsController
      include RenderJson
      include JsonExceptionHandler

      skip_before_action :verify_authenticity_token
      wrap_parameters format: []
    end
  end
end
