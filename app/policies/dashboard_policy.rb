class DashboardPolicy < Struct.new(:user, :dashboard)
  def dashboard?
    user&.role&.present? && !user.citizen?
  end
end
