# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user&.company.blank?

    user.role.permissions.each do |permission|
      can :manage, permission.model_reference.singularize.constantize
    end
  end
end
