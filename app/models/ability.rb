class Ability

  include CanCan::Ability

  def initialize(user)
    @user = user

    return if @user&.user_company.blank?

    if @user.user_company.user_roles.map(&:role).map(&:name).include?('admin')
      can :manage, :all
    else
      @user.user_company.user_roles.includes(:role).map(&:role).each do |role|
        role_action = role.name.split('_')
        # user_role = @roles.include?(role)
        can role_action[1].to_sym, role_action[0].camelize.constantize
      end
    end
  end

end
