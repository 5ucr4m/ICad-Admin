# frozen_string_literal: true

class HomeRegistrationsController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_home_registration, only: %i[show edit update destroy]

  breadcrumb HomeRegistration.model_name.human(count: 2), :home_registrations_path

  # GET /home_registrations
  def index
    @query = HomeRegistration.ransack(params[:q])
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @home_registrations = pagy(@result.includes(:home_type, :health_professional), page: params[:page], items: 10)
  end

  # GET /home_registrations/1
  def show
    breadcrumb @home_registration.slug, home_registration_path(@home_registration)
  end

  # GET /home_registrations/new
  def new
    breadcrumb t('helpers.submit.new'), new_home_registration_path
    @home_registration = HomeRegistration.new
    @home_registration.build_relationships
  end

  # GET /home_registrations/1/edit
  def edit
    breadcrumb @home_registration.slug, home_registration_path(@home_registration)
  end

  # POST /home_registrations
  def create
    breadcrumb t('helpers.submit.new'), new_home_registration_path
    @home_registration = current_user.home_registrations.build(home_registration_params)
    @city_selected = @home_registration.address.city.presence
    @address_type_selected = @home_registration.address.address_type.presence

    if @home_registration.save
      redirect_to home_registrations_url, notice: 'Home registration was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /home_registrations/1
  def update
    breadcrumb @home_registration.slug, home_registration_path(@home_registration)
    if @home_registration.update(home_registration_params)
      redirect_to home_registrations_url, notice: 'Home registration was successfully updated.'
    else
      render :edit
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
    @city_selected = @home_registration.address.city.presence
    @address_type_selected = @home_registration.address.address_type.presence
  end

  # Only allow a trusted parameter "white list" through.
  def home_registration_params
    params.require(:home_registration).permit(:health_professional_id,
                                              :living_condition_id, :address_id,
                                              :form_updated, :pet_quantity,
                                              :refuse_registration, :tp_cds_origin,
                                              :uuid, :uuid_form_origin,
                                              :home_type_id,
                                              :location_x,
                                              :location_y,
                                              :finished,
                                              families_attributes: %i[
                                                id
                                                responsible_birth_date
                                                responsible_cns_number
                                                members_quantity
                                                handbook_number
                                                family_income_id
                                                reside_since
                                                moving
                                              ],
                                              address_attributes: %i[
                                                id
                                                address_type_id
                                                patio
                                                number
                                                zip
                                                complement
                                                district
                                                city_id
                                                referential_phone
                                                home_phone
                                                reference
                                                out_area
                                                micro_area
                                              ],
                                              permanence_institution_attributes: %i[
                                                id
                                                name
                                                other_linked_professionals
                                                responsible_name
                                                responsible_cns
                                                institutional_role
                                                responsible_phone
                                              ],
                                              living_condition_attributes: %i[
                                                id
                                                water_supply_id
                                                rural_production_area_id
                                                garbage_disposal_id
                                                bathroom_drainage_id
                                                home_location_id
                                                home_wall_material_id
                                                rooms
                                                residents
                                                home_situation_id
                                                electric_power
                                                home_access_id
                                                home_type_id
                                                water_treatment_id
                                              ],
                                              home_registration_pets_attributes: %i[
                                                id
                                                pet_type_id
                                                _destroy
                                              ])
  end
end
