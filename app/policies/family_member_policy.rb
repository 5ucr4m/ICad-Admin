class FamilyMemberPolicy < ApplicationPolicy
  def index?
    user&.role&.present? && !user.doctor? && !user.citizen?
  end

  def show?
    index?
  end

  def create?
    user.admin? || user.agent?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    create?
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
