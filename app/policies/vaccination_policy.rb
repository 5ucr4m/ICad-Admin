class VaccinationPolicy < ApplicationPolicy
  def index?
    user&.role&.present?
  end

  def show?
    index?
  end

  def new?
    user.admin? || user.nurse? || user.nurse_aux?
  end

  def create?
    new?
  end

  def update?
    new?
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
