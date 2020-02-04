class DashboardPolicy < Struct.new(:user, :dashboard)
  def dashboard?
    user&.role&.present?
  end
end
