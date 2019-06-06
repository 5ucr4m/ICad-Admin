# frozen_string_literal: true

module Api
  class FamiliesController < Api::ApiController
    before_action :set_family, only: %i[show update destroy]

    # GET /families
    api :GET, '/families', 'GET Families List'
    def index
      @query = Family.ransack(params[:q])
      @families = @query.result.includes(:company, :home_registration)
      @families = @families.where(home_registration_id: params[:home_registration_id]) if params[:home_registration_id]
      render_json @families
    end

    # GET /families/1
    api :GET, '/families/:id', 'GET Family by ID'
    def show
      render_json @family
    end

    # POST /families
    api :POST, '/families', 'POST a Family'
    def create
      @family = Family.new(family_params)

      @city_selected = @family&.home_registration&.address&.city.presence

      if @family.save
        render_json @family, :created
      else
        unprocessable_entity @family
      end
    end

    # PATCH/PUT /families/1
    api :PATCH, '/families/:id', 'PATCH Family'
    api :PUT, '/families/:id', 'PUT Family'
    def update
      if @family.update(family_params)
        render_json @family, :ok, true
      else
        unprocessable_entity @family
      end
    end

    # DELETE /families/1
    api :DELETE, '/families/:id', 'Delete Family'
    def destroy
      @family.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def family_params
      params.require(:family).permit(:responsible_birth_date,
                                     :responsible_cns_number,
                                     :members_quantity, :handbook_number,
                                     :family_income, :reside_since,
                                     :moving, :home_registration_id,
                                     :form_updated,
                                     :pet_quantity,
                                     :refuse_registration,
                                     :tp_cds_origin,
                                     :home_type_id,
                                     :finished,
                                     family_members_attributes: %i[
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
                                     ],
                                     home_registration_attributes: [
                                       :id,
                                       :health_professional_id,
                                       :home_type_id,
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
                                       ]
                                     ])
    end
  end
end
