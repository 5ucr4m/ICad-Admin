# frozen_string_literal: true
class GenericModelPolicy < ApplicationPolicy
  def index?
    user&.role&.present?
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
