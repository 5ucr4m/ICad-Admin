# frozen_string_literal: true

module Api
  module Overrides
    class SessionsController < ::DeviseTokenAuth::SessionsController
      include RenderJson
      include JsonExceptionHandler

      skip_before_action :verify_authenticity_token
      wrap_parameters format: []

      private

      def authenticate_cns(resource)
        return false if resource.health_professional.blank?

        resource.health_professional.cns_code == params[:cns_code]
      end

      def render_create_success
        render json: @resource, serializer: UserSerializer
      end

      def render_create_error_bad_credentials
        not_authorized I18n.t('devise.failure.invalid', authentication_keys: %w[email CNS].join(', '))
      end

      def continue_sign_in(resource, resource_name)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      end
    end
  end
end
