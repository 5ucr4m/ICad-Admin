# frozen_string_literal: true

module JsonExceptionHandler
  extend ActiveSupport::Concern

  included do
    respond_to do |format|
      if format.json
        rescue_from ActiveRecord::RecordNotFound, with: :login_request
        rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
        rescue_from ActiveRecord::RecordNotFound, with: :not_found
        rescue_from CanCan::AccessDenied, with: :not_authorized
      end
    end
  end

  def login_request
    controller_name == 'login' ? :unauthorized : :not_found
  end

  def bad_request
    render json: {error: 'Bad request'}, status: :bad_request
  end

  def forbidden(message = nil)
    render json: {error: message || 'Forbidden'}, status: :forbidden
  end

  def not_authorized(message = nil)
    render json: {error: message || 'Not authorized'}, status: :unauthorized
  end

  def not_found
    render json: {error: 'Not found'}, status: :not_found
  end

  def unprocessable_entity(model)
    render json: model.errors, status: :unprocessable_entity
  end
end
