# frozen_string_literal: true

module Overrides
  class RegistrationsController < Devise::RegistrationsController
    include RenderJson
    include ExceptionHandler

    def create
      if params['user']['uid'].nil? && params['user']['provider'].nil?
        configure_permitted_parameters
        params['user']['uid'] = params['user']['email']
        params['user']['provider'] = 'email'
      end
      super
    end

    def edit
      super
    end

    protected

    def after_update_path_for(_resource)
      edit_user_registration_path
    end
  end
end
