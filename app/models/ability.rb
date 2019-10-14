# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    return if @user&.current_company.blank?

    @user.current_company.roles.find_each do |role|
      can role.action_reference.to_sym, role.model_reference.camelize.constantize
    end
  end
end
