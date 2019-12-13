# frozen_string_literal: true

module Api
  class HomeRegistrationsController < Api::ApiController
    load_and_authorize_resource
    before_action :set_home_registration, only: %i[show update destroy]

    # GET /home_registrations
    def index
      @query = HomeRegistration.ransack(params[:q])
      @result = @query.result
      @result = @result.where(user: current_user) if current_user.agent?
      render_json @result
    end

    # GET /home_registrations/1
    def show
      render_json @home_registration
    end

    # POST /home_registrations
    def create
      @home_registration = current_user.home_registrations.build(home_registration_params)

      if @home_registration.save
        render_json @home_registration, :created, true
      else
        unprocessable_entity @home_registration
      end
    end

    # PATCH/PUT /home_registrations/1
    def update
      if @home_registration.update(home_registration_params)
        render_json @home_registration, :ok
      else
        unprocessable_entity @home_registration
      end
    end

    # DELETE /home_registrations/1
    def destroy
      @home_registration.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_home_registration
      @home_registration = HomeRegistration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def home_registration_params
      params.require(:home_registration).permit(:health_professional_id,
                                                :form_updated,
                                                :pet_quantity,
                                                :refuse_registration,
                                                :tp_cds_origin,
                                                :uuid,
                                                :uuid_form_origin,
                                                :home_type_id,
                                                :finished,
                                                families_attributes: [
                                                  :id,
                                                  :responsible_birth_date,
                                                  :responsible_cns_number,
                                                  :members_quantity,
                                                  :handbook_number,
                                                  :family_income_id,
                                                  :reside_since,
                                                  :moving,
                                                  :_destroy,
                                                  family_members_attributes: %i[
                                                    social_name city_id
                                                    birth_date unknown_mother mother_name
                                                    email nationality_id name cns_number
                                                    cns_responsible phone pis_pasep_number
                                                    birth_country_id race_id gender_id
                                                    responsible ethnicity_id unknown_father
                                                    father_name naturalized_at naturalize_decree
                                                    brazil_entry_date micro_area out_area _destroy
                                                  ]
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
