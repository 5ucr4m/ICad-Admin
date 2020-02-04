module Api
  class FamilyPolicy < ::ApplicationPolicy
    def index?
      user.admin? || user.agent?
    end

    def show?
      index?
    end

    def create?
      index?
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
