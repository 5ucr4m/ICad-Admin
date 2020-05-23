# frozen_string_literal: true
class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    if resource.citizen? || resource&.company.present? && !resource.admin?
      sign_out_all_scopes
      flash[:alert] = 'Usuário inválido'
      redirect_to(new_user_session_path)
    else
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with(resource, location: after_sign_in_path_for(resource))
    end
  end
end
