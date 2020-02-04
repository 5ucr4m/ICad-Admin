module Api
  class CityPolicy < ::ApplicationPolicy
    def index?
      user.admin? || user.agent?
    end

    def show?
      index?
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
