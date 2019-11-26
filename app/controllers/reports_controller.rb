# frozen_string_literal: true

class ReportsController < WebController
  breadcrumb 'Relatórios', :root_path

  def families
    @query = Family.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @family_members = @result.map(&:family_members).flatten
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def family_members
    @query = FamilyMember.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def individual_registrations
    @query = IndividualRegistration.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def home_registrations
    @query = HomeRegistration.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def home_visit_registrations
    @query = HomeVisitForm.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def vaccinations
    @query = Vaccination.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  private

  def permitted_params
    return if params[:q].blank?

    params[:q].delete_if { |_query, value| value.blank? || value == false }
  end
end
