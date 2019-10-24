# frozen_string_literal: true

module Api
  class IndividualRegistrationsController < Api::ApiController
    before_action :set_individual_registration, only: %i[show edit update destroy]

    # GET /individual_registrations
    def index
      @query = IndividualRegistration.ransack(params[:q])
      @pagy, @individual_registrations = pagy(@query.result, page: params[:page], items: 10)
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
      @individual_registration = IndividualRegistration.new(individual_registration_params)

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
      @individual_registration = IndividualRegistration
                                 .friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def individual_registration_params
      params.require(:individual_registration).permit(:refuse_registration,
                                                      :form_updated,
                                                      :uuid,
                                                      :uuid_form_origin,
                                                      :uuid_citizen,
                                                      :tp_cds_origin,
                                                      :family_member_id,
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
                                                      in_street_situation_attributes: %i[
                                                        id
                                                        kinship_degree
                                                        other_accompanied
                                                        meals_per_day_id
                                                        has_other_accompanied
                                                        familiar_reference
                                                        receive_benefits
                                                        in_street_situation
                                                        has_personal_hygiene
                                                        family_visit
                                                        street_situation_time_id
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
                                                      ])
    end
  end
end
