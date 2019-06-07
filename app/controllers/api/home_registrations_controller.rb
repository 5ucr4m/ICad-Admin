# frozen_string_literal: true

module Api
  class HomeRegistrationsController < Api::ApiController
    before_action :set_home_registration, only: %i[show update destroy]

    # GET /home_registrations
    api :GET, '/home_registrations', 'GET Home Registrations List'
    def index
      @query = HomeRegistration.ransack(params[:q])
      @home_registrations = @query.result.includes(:company, :home_registration)
      @home_registrations = @home_registrations.where(health_professional_id: params[:health_professional_id]) if params[:health_professional_id]
      render_json @home_registrations
    end

    # GET /home_registrations/1
    api :GET, '/home_registrations/:id', 'GET Home Registration'
    def show
      render_json @home_registration
    end

    # POST /home_registrations
    api :POST, '/home_registrations', 'GET Home Registrations List'
    def create
      @home_registration = HomeRegistration.new(home_registration_params)
      @city_selected = @home_registration.address.city.presence
      @address_type_selected = @home_registration.address.address_type.presence

      if @home_registration.save
        render_json @home_registration, :created
      else
        unprocessable_entity @home_registration
      end
    end

    # PATCH/PUT /home_registrations/1
    api :PATCH, '/home_registrations/:id', 'PATCH Home Registration'
    api :PUT, '/home_registrations/:id', 'PUT Home Registration'
    def update
      if @home_registration.update(home_registration_params)
        render_json @home_registration, :ok, true
      else
        unprocessable_entity @home_registration
      end
    end

    # DELETE /home_registrations/1
    api :DELETE, '/home_registrations/:id', 'DELETE Home Registration'
    def destroy
      @home_registration.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_home_registration
      @home_registration = HomeRegistration.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def home_registration_params
      params.require(:home_registration).permit(:health_professional_id,
                                                :living_condition_id, :address_id,
                                                :form_updated, :pet_quantity,
                                                :refuse_registration, :tp_cds_origin,
                                                :uuid, :uuid_form_origin,
                                                :home_type_id,
                                                :finished,
                                                families_attributes: %i[
                                                  id
                                                  responsible_birth_date
                                                  responsible_cns_number
                                                  members_quantity
                                                  handbook_number
                                                  family_income_cents
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
end
