class IndividualRegistrationsController < ApplicationController
  before_action :set_individual_registration, only: %i[show edit update destroy]

  # GET /individual_registrations
  def index
    @query = IndividualRegistration.ransack(params[:q])
    @pagy, @individual_registrations = pagy(@query.result, page: params[:page])
  end

  # GET /individual_registrations/1
  def show
  end

  # GET /individual_registrations/new
  def new
    @individual_registration = IndividualRegistration.new
  end

  # GET /individual_registrations/1/edit
  def edit
  end

  # POST /individual_registrations
  def create
    @individual_registration = IndividualRegistration.new(individual_registration_params)

    if @individual_registration.save
      redirect_to @individual_registration, notice: 'Individual registration was successfully created.', status: :created
    else
      unprocessable_entity @individual_registration
    end
  end

  # PATCH/PUT /individual_registrations/1
  def update
    if @individual_registration.update(individual_registration_params)
      redirect_to @individual_registration, notice: 'Individual registration was successfully updated.'
    else
      unprocessable_entity @individual_registration
    end
  end

  # DELETE /individual_registrations/1
  def destroy
    @individual_registration.destroy
    redirect_to individual_registrations_url, notice: 'Individual registration was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_individual_registration
      @individual_registration = IndividualRegistration.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def individual_registration_params
      params.require(:individual_registration).permit(:health_condition_id, :in_street_situation_id, :family_member_id, :sociodemographic_info_id, :cancel_registration_id, :refuse_registration, :form_updated, :uuid, :uuid_form_origin, :uuid_citizen, :tp_cds_origin, :company_id, :slug)
    end
end
