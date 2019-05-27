# frozen_string_literal: true

class HomeVisitRegistrationsController < WebController
  before_action :set_home_visit_registration, only: %i[show edit update destroy]

  # GET /home_visit_registrations
  def index
    @query = HomeVisitRegistration.ransack(params[:q])
    @pagy, @home_visit_registrations = pagy(@query.result, page: params[:page])
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
    @home_visit_registration = HomeVisitRegistration.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def home_visit_registration_params
    params.require(:home_visit_registration).permit(:family_member_id, :uuid, :tp_cds_origin, :company_id, :slug)
  end
end
