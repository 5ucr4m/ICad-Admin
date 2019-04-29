# frozen_string_literal: true

module Api
  module Overrides
    class RegistrationsController < DeviseTokenAuth::RegistrationsController
      include RenderJson
      include JsonExceptionHandler

      skip_before_action :verify_authenticity_token
      wrap_parameters User, include: %i[cns email password password_confirmation]

      def create
        super
      end

      private

      def render_create_success
        render json: @resource, serializer: UserSerializer
      end

      def render_update_success
        render json: @resource, serializer: UserSerializer
      end

      def render_create_error
        unprocessable_entity(@resource)
      end


      def sign_up_params
        params.require(:user).permit(:cns, :email, :password, :password_confirmation)
      end
    end
  end
end
