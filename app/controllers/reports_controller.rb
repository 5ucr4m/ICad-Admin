# frozen_string_literal: true

class ReportsController < WebController
  breadcrumb 'Relatórios', :root_path

  def families
    @query = Family.ransack(permitted_params)
    @result = @query.result.includes(:family_income)
    @result = @result.where(user: current_user) if current_user.agent?
    if @result.empty?
      blank_return
    else
      query_return @result, @result.includes(family_members: %i[ethnicity gender home_registration]).map(&:family_members).flatten
    end
  end

  def family_members
    @query = FamilyMember.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    if @result.empty?
      blank_return
    else
      @result = @result.includes(:ethnicity, :gender, :home_registration, city: [:state])
      query_return @result, @result
    end
  end

  def individual_registrations
    @query = IndividualRegistration.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    if @result.empty?
      blank_return
    else
      @result = @result.includes(sociodemographic_info:
                                     %i[gender_identity parent_relation occupation job_market_situation],
                                 family_member: %i[ethnicity gender home_registration])
      query_return @result, @result.map(&:family_member).flatten
    end
  end

  def home_registrations
    @query = HomeRegistration.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    if @result.empty?
      blank_return
    else
      @result = @result.includes(family_members: %i[ethnicity gender home_registration])
      query_return @result, @result.map(&:family_members).flatten
    end
  end

  def home_visit_registrations
    @query = HomeVisitForm.ransack(permitted_params)
    @result = @query.result
    @result = @result.includes(:user).where(user: current_user)
    if @result.empty?
      blank_return
    else
      @result = @result.includes(family_members: %i[ethnicity gender home_registration])
      query_return @result, @result.map(&:family_member).flatten
    end
  end

  def vaccinations
    @query = Vaccination.ransack(permitted_params)
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    if @result.empty?
      blank_return
    else
      @result = @result.includes(family_members: %i[ethnicity gender home_registration])
      query_return @result, @result.map(&:family_member).flatten
    end
  end

  private

  def permitted_params
    return if params[:q].blank?

    params[:q].delete_if { |_query, value| value.blank? || value == false }
  end

  def blank_return
    respond_to do |format|
      format.html do
        @pagy, @list = pagy(@result, page: params[:page], items: 10)
      end
      format.json do
        render_json []
      end
    end
  end

  def query_return(result, family_members)
    respond_to do |format|
      format.html do
        @pagy, @list = pagy(result, page: params[:page], items: 10)
      end
      format.json do
        render_json family_members
      end
    end
  end
end
