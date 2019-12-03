# frozen_string_literal: true

module Api
  class FamiliesController < Api::ApiController
    load_and_authorize_resource
    before_action :set_family, only: %i[show update destroy]

    # GET /families
    def index
      @query = Family.ransack(params[:q])
      @families = @query.result.includes(:company, :home_registration)
      @families = @families.where(user: current_user) if current_user.agent?
      render_json @families
    end

    # GET /families/1
    def show
      render_json @family
    end

    # POST /families
    def create
      @family = current_user.families.build(family_params)

      @city_selected = @family&.home_registration&.address&.city.presence

      if @family.save
        render_json @family, :created
      else
        unprocessable_entity @family
      end
    end

    # PATCH/PUT /families/1
    def update
      if @family.update(family_params)
        render_json @family, :ok, true
      else
        unprocessable_entity @family
      end
    end

    # DELETE /families/1
    def destroy
      @family.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_family
      @family = Family.find(params[:id])
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
                                     :home_registration_id,
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
                                     ])
    end
  end
end
