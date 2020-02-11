class ReportPolicy < Struct.new(:user, :report)
  def families?
    default_policy
  end

  def family_members?
    default_policy
  end

  def individual_registrations?
    default_policy
  end

  def home_registrations?
    default_policy
  end

  def home_visit_registrations?
    default_policy
  end

  def vaccinations?
    default_policy
  end

  def resume_registry?
    default_policy
  end

  def sociodemographic_situation?
    default_policy
  end

  def street_situation?
    default_policy
  end

  def family_member_disabilities?
    default_policy
  end

  private

  def default_policy
    user&.role&.present? && !user.doctor? && !user.citizen?
  end
end
