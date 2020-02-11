# frozen_string_literal: true
class GenericModelPolicy < ApplicationPolicy
  def index?
    user&.role&.present? && !user.doctor? && !user.citizen?
  end

  def address_types?
    index?
  end

  def cbo_types?
    index?
  end

  def ethnicity_types?
    index?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
