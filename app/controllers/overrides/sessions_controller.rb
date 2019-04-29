module Overrides
  class SessionsController < Devise::SessionsController
    include RenderJson
    include ExceptionHandler

    skip_before_action :verify_authenticity_token, only: :create, raise: false
  end
end
