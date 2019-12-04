# frozen_string_literal: true

module Api
  class IndividualRegistrationsController < Api::ApiController
    load_and_authorize_resource
    before_action :set_individual_registration, only: %i[show edit update destroy]

    # GET /individual_registrations
    def index
      @query = IndividualRegistration.ransack(params[:q])
      @result = @query.result
      @result = @result.where(user: current_user) if current_user.agent?
      render_json @result
    end

    # GET /individual_registrations/1
    def show
      render_json @individual_registration
    end

    # GET /individual_registrations/new
    def new
      @individual_registration = IndividualRegistration.new
      @individual_registration.build_relationships
      @occupation_selected = @individual_registration.sociodemographic_info.occupation.presence
    end

    # GET /individual_registrations/1/edit
    def edit; end

    # POST /individual_registrations
    def create
      @individual_registration = current_user.individual_registrations.build(individual_registration_params)

      if @individual_registration.save
        render_json @individual_registration, :created
      else
        unprocessable_entity @individual_registration
      end
    end

    # PATCH/PUT /individual_registrations/1
    def update
      if @individual_registration.update(individual_registration_params)
        render_json @individual_registration, :ok, true
      else
        unprocessable_entity @individual_registration
      end
    end

    # DELETE /individual_registrations/1
    def destroy
      @individual_registration.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_individual_registration
      @individual_registration = IndividualRegistration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def individual_registration_params
      params.require(:individual_registration).permit(
        :family_member_id,
        :refuse_registration,
        :form_updated,
        :uuid,
        :uuid_form_origin,
        :uuid_citizen,
        :tp_cds_origin,
        family_member_attributes: %i[
          family_id social_name city_id
          birth_date unknown_mother mother_name
          email nationality_id name cns_number
          cns_responsible phone pis_pasep_number
          birth_country_id race_id gender_id
          responsible ethnicity_id unknown_father
          father_name naturalized_at naturalize_decree
          brazil_entry_date micro_area out_area
        ],
        health_condition_attributes: %i[
          id
          hospitalization_cause
          other_condition_one
          other_condition_two
          other_condition_three
          medicinal_plants_used
          maternity_reference
          weight_situation_id
          alcohol_dependent
          other_drugs_dependent
          smoker
          pregnant
          bedridden
          domiciled
          diabetic
          respiratory
          hypertension
          cancer
          kidneys
          leprosy
          tuberculosis
          avc_stroke
          had_heart_attack
          had_heart_disease
          recently_hospitalized
          mental_issue
          integrative_practices
          medicinal_plants
        ],
        in_street_situation_attributes: [
          :id,
          :kinship_degree,
          :other_accompanied,
          :meals_per_day_id,
          :has_other_accompanied,
          :familiar_reference,
          :receive_benefits,
          :in_street_situation,
          :has_personal_hygiene,
          :family_visit,
          :street_situation_time_id,
          in_street_hygiene_accesses_attributes: %i[
            id
            hygiene_access_id
            _destroy
          ]
        ],
        sociodemographic_info_attributes: [
          :id,
          :education_level_id,
          :occupation_id,
          :sexual_orientation_id,
          :traditional_community_name,
          :parent_relation_id,
          :job_market_situation_id,
          :desire_orientation,
          :attend_folk_healer,
          :traditional_community,
          :attend_school,
          :community_group,
          :health_plan,
          :has_any_disability,
          :desire_gender,
          :gender_identity_id,
          family_member_disabilities_attributes: %i[
            id
            disability_id
            _destroy
          ]
        ],
        cancel_registration_attributes: %i[
          id
          left_reason_id
          decease_date
          decease_number
        ]
      )
    end
  end
end
