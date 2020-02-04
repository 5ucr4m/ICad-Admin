class SmsMessagePolicy < ApplicationPolicy
  def index?
    user.admin? || user.support?
  end

  def show?
    index?
  end

  def new?
    user.admin? || user.support?
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
