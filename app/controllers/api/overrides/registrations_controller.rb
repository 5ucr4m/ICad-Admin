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
        attribute_params
      end

      def sign_up_params
        attribute_params
      end

      def attribute_params
        params.permit(:email, :password, :password_confirmation,
                      health_professional_attributes: %i[
                        cns_code
                        cbo_code_id
                        cnes_code
                        federal_registry
                        state_registry
                        legal_full_name
                        fancy_name
                      ])
      end
    end
  end
end
