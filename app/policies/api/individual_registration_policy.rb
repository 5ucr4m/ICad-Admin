module Api
  class IndividualRegistrationPolicy < ::ApplicationPolicy
    def index?
      user&.role&.present? && !user.doctor? && !user.citizen?
    end

    def show?
      index?
    end

    def new?
      user.admin? || user.agent?
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
end
