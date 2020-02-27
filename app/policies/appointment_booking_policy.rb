class AppointmentBookingPolicy < ApplicationPolicy
  def index?
    user.admin? || user.doctor? || user.service?
  end

  def show?
    user.admin? || user.doctor? || user.service?
  end

  def new?
    user.admin? || user.service? || user.doctor?
  end

  def create?
    new?
  end

  def update?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def destroy?
    user.admin?
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
