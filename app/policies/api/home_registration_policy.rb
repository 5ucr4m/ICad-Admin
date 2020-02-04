module Api
  # frozen_string_literal: true
  class HomeRegistrationPolicy < ::ApplicationPolicy
    def index?
      user&.role&.present?
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

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
