# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user&.company.blank?
      assign_roles 'guest'
    else
      assign_roles user.role.role_type
    end
  end

  protected

  def assign_roles(role)
    send("#{role}_roles")
  end

  def admin_roles
    can :manage, :all
  end

  def mayor_roles; end

  def secretary_roles; end

  def doctor_roles; end

  def nurse_roles; end

  def nurse_aux_roles; end

  def agent_roles; end

  def dentist_roles; end

  def dentist_aux_roles; end

  def guest_roles
    cannot :read, :all
  end
end
