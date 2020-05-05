class PatientRecordPolicy < ApplicationPolicy
  def index?
    user&.role&.present? && user.doctor? || user&.role&.present? && user.service?
  end

  def show?
    index?
  end

  def new?
    user&.role&.present? && user.doctor? || user&.role&.present? && user.service?
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

  def manage?
    create? && update? && destroy?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
