class AppointmentBookingPolicy < ApplicationPolicy
  def index?
    user.admin? || user.doctor? || user.service?
  end

  def show?
    user.admin? || user.doctor? && record.health_professional == user&.health_professional || user.service?
  end

  def new?
    user.admin? || user.service?
  end

  def create?
    new?
  end

  def update?
    show?
  end

  def edit?
    update?
  end

  def destroy?
    new?
  end

  def manage?
    user.admin? || user.service?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
