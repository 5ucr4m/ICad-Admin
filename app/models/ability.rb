# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    return if @user&.current_company.blank?

    @user.current_company.roles.find_each do |role|
      role_action = role.name.split('_')
      can role_action[1].to_sym, role_action[0].camelize.constantize
    end
  end
end
