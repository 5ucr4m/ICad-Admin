# frozen_string_literal: true

class HomeVisitRegistrationsController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_home_visit_registration, only: %i[show edit update destroy]

  breadcrumb HomeVisitRegistration.model_name.human(count: 2), :home_visit_registrations_path

  # GET /home_visit_registrations
  def index
    @query = HomeVisitRegistration.ransack(params[:q])
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @home_visit_registrations = pagy(@result, page: params[:page], items: 10)
  end

  # GET /home_visit_registrations/1
  def show
    breadcrumb @home_visit_registration.slug, home_visit_registration_path(@home_visit_registration)
  end

  # GET /home_visit_registrations/new
  def new
    breadcrumb t('helpers.submit.new'), new_home_visit_registration_path
    @home_visit_registration = HomeVisitRegistration.new
    @home_visit_registration.build_relation_ships
  end

  # GET /home_visit_registrations/1/edit
  def edit
    breadcrumb @home_visit_registration.slug, home_visit_registration_path(@home_visit_registration)
  end

  # POST /home_visit_registrations
  def create
    breadcrumb t('helpers.submit.new'), new_home_visit_registration_path
    @home_visit_registration = current_user.home_visit_registrations.build(home_visit_registration_params)
    @city_selected = @home_visit_registration&.family_member&.city&.presence

    if @home_visit_registration.save
      redirect_to @home_visit_registration, notice: 'Home visit registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /home_visit_registrations/1
  def update
    breadcrumb @home_visit_registration.slug, home_visit_registration_path(@home_visit_registration)
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
    @home_visit_registration = HomeVisitRegistration.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def home_visit_registration_params
    params.require(:home_visit_registration).permit(:family_member_id,
                                                    :uuid, :tp_cds_origin,
                                                    home_visit_forms_attributes: [
                                                      :id,
                                                      :turn_id,
                                                      :handbook_number,
                                                      :cns_number,
                                                      :birth_date,
                                                      :gender_id,
                                                      :other_visit,
                                                      :outcome_id,
                                                      :micro_area,
                                                      :out_area,
                                                      :home_type_id,
                                                      :weight_monitoring,
                                                      :height_monitoring,
                                                      :_destroy,
                                                      home_visit_reasons_attributes: %i[
                                                        id
                                                        reason_id
                                                        _destroy
                                                      ]
                                                    ])
  end
end
