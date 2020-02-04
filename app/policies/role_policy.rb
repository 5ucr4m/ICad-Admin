class RolePolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    index?
  end

  def new?
    index?
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
