class ChartPolicy < Struct.new(:user, :chart)
  def chart_families?
    default_policy
  end

  def chart_family_members?
    default_policy
  end

  def chart_home_visit_registrations?
    default_policy
  end

  def chart_individual_registrations?
    default_policy
  end

  def chart_home_registrations?
    default_policy
  end

  def chart_periods?
    default_policy
  end

  def chart_vaccinations?
    default_policy
  end

  private

  def default_policy
    user&.role&.present? && !user.doctor? && !user.citizen?
  end
end
