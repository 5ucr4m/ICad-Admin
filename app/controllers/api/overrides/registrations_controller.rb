# frozen_string_literal: true

module Api
  module Overrides
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      include RenderJson
      include JsonExceptionHandler

      skip_before_action :verify_authenticity_token
      wrap_parameters format: []

      protected

      def render_create_success
        render json: @resource, serializer: UserSerializer
      end

      def render_update_success
        render json: @resource, serializer: UserSerializer
      end

      def account_update_params
        params.permit(:email)
      end

      def sign_up_params
        params.permit(:email, :password, :password_confirmation, :cns_code, :cnes_code, :cbo_code)
      end
    end
  end
end
