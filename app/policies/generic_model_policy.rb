# frozen_string_literal: true
class GenericModelPolicy < ApplicationPolicy
  def index?
    user&.role&.present? && !user.doctor? && !user.citizen?
  end

  def address_types?
    index?
  end

  def cbo_types?
    index?
  end

  def ethnicity_types?
    index?
  end

  def carried_procedures?
    index?
  end

  def exams?
    index?
  end

  def pharmaceutical_forms?
    index?
  end

  def collected_times?
    index?
  end

  def duration_types?
    index?
  end

  def dose_frequency_types?
    index?
  end

  def recipe_types?
    index?
  end

  def specialties?
    index?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
