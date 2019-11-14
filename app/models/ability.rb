# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return if user&.company.blank?

    if user.role.admin?
      can :manage, :all
    else
      can :manage, user, slug: user.slug
      user.role.permissions.each do |permission|
        model = permission.model_reference.singularize.constantize
        if user.role.agent? && Role::AGENT_FORMS.include?(model)
          can :manage, model, user_id: user.id, company_id: user.company.id
        else
          can :manage, model
        end
      end
    end
  end
end
