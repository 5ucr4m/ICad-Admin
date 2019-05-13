class HomeRegistrationsController < ApplicationController
  before_action :set_home_registration, only: %i[show edit update destroy]

  # GET /home_registrations
  def index
    @query = HomeRegistration.ransack(params[:q])
    @pagy, @home_registrations = pagy(@query.result, page: params[:page])
  end

  # GET /home_registrations/1
  def show
  end

  # GET /home_registrations/new
  def new
    @home_registration = HomeRegistration.new
  end

  # GET /home_registrations/1/edit
  def edit
  end

  # POST /home_registrations
  def create
    @home_registration = HomeRegistration.new(home_registration_params)

    if @home_registration.save
      redirect_to @home_registration, notice: 'Home registration was successfully created.', status: :created
    else
      unprocessable_entity @home_registration
    end
  end

  # PATCH/PUT /home_registrations/1
  def update
    if @home_registration.update(home_registration_params)
      redirect_to @home_registration, notice: 'Home registration was successfully updated.'
    else
      unprocessable_entity @home_registration
    end
  end

  # DELETE /home_registrations/1
  def destroy
    @home_registration.destroy
    redirect_to home_registrations_url, notice: 'Home registration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_registration
      @home_registration = HomeRegistration.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def home_registration_params
      params.require(:home_registration).permit(:health_professional_id, :living_condition_id, :address_id, :registry_updated, :pet_quantity, :refuse_registration, :tp_cds_origin, :uuid, :uuid_origin, :home_type_id, :permanence_institution_id, :finished, :company_id, :slug)
    end
end
