# frozen_string_literal: true

class HomeVisitRegistrationsController < WebController
  before_action :set_home_visit_registration, only: %i[show edit update destroy]

  def chart_by_day
    render_json HomeVisitRegistration.by_company(current_user.company)
                                     .group_by_period(:day, :updated_at,
                                                      format: '%d/%m/%Y', last: 5).count
  end

  # GET /home_visit_registrations
  def index
    @query = HomeVisitRegistration.by_company(current_user.company).ransack(params[:q])
    @pagy, @home_visit_registrations = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /home_visit_registrations/1
  def show; end

  # GET /home_visit_registrations/new
  def new
    @home_visit_registration = HomeVisitRegistration.new
    @home_visit_registration.build_family_member
  end

  # GET /home_visit_registrations/1/edit
  def edit; end

  # POST /home_visit_registrations
  def create
    @home_visit_registration = HomeVisitRegistration.new(home_visit_registration_params)
    @city_selected = @home_visit_registration.family_member.city.presence

    if @home_visit_registration.save
      redirect_to @home_visit_registration, notice: 'Home visit registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /home_visit_registrations/1
  def update
    if @home_visit_registration.update(home_visit_registration_params)
      redirect_to @home_visit_registration, notice: 'Home visit registration was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /home_visit_registrations/1
  def destroy
    @home_visit_registration.destroy
    redirect_to home_visit_registrations_url, notice: 'Home visit registration was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_home_visit_registration
    @home_visit_registration = HomeVisitRegistration.by_company(current_user.company).friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def home_visit_registration_params
    params.require(:home_visit_registration).permit(:family_member_id,
                                                    :uuid, :tp_cds_origin,
                                                    family_member_attributes: %i[
                                                      id
                                                      name
                                                      social_name
                                                      mother_name
                                                      father_name
                                                      birth_date
                                                      birth_country_id
                                                      city_id
                                                      nationality_id
                                                      naturalized_at
                                                      naturalize_decree
                                                      brazil_entry_date
                                                      email
                                                      cns_number
                                                      cns_responsible
                                                      phone
                                                      pis_pasep_number
                                                      race_id
                                                      gender_id
                                                      ethnicity_id
                                                      micro_area
                                                      unknown_father
                                                      unknown_mother
                                                      responsible
                                                      out_area
                                                    ]).merge(company: current_user.company)
  end
end
