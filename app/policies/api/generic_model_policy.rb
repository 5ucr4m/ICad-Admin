module Api
  # frozen_string_literal: true
  class GenericModelPolicy < ::ApplicationPolicy
    def index?
      user&.role&.present?
    end

    def show?
      index?
    end

    def types?
      index?
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
