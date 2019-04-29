# frozen_string_literal: true

module Api
  module Overrides
    class SessionsController < DeviseTokenAuth::SessionsController
      include RenderJson
      include JsonExceptionHandler

      skip_before_action :verify_authenticity_token, only: :create, raise: false

      def create
        super
      end

      private

      def authenticate_cns(cns); end

      def render_create_success
        render json: @resource, serializer: UserSerializer
      end

      def render_create_error_bad_credentials
        not_authorized I18n.t('devise.failure.invalid', authentication_keys: %i[email])
      end
    end
  end
end
