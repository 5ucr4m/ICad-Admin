class HealthProfessionalPolicy < ApplicationPolicy
  def index?
    user.admin? || user.support? || user.secretary?
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    index?
  end

  def update?
    index?
  end

  def edit?
    update?
  end

  def destroy?
    index?
  end

  def manage?
    create? && update? && destroy?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
