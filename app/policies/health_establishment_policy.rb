class HealthEstablishmentPolicy < ApplicationPolicy
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
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
