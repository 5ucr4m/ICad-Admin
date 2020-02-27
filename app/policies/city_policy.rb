class CityPolicy < ApplicationPolicy
  def index?
    user&.user_roles&.any?
  end

  def show?
    index?
  end

  def new?
    user.support?
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
