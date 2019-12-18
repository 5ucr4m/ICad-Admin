# frozen_string_literal: true

module Api
  class HealthConditionsController < Api::ApiController
    load_and_authorize_resource
    before_action :set_health_condition, only: %i[show update destroy]

    # GET /health_conditions/1
    def show
      render_json @health_condition
    end

    # POST /health_conditions
    def create
      @health_condition = HealthCondition.new(health_condition_params)

      if @health_condition.save
        render_json @health_condition, :created
      else
        unprocessable_entity @health_condition
      end
    end

    # PATCH/PUT /health_conditions/1
    def update
      if @health_condition.update(health_condition_params)
        render_json @health_condition, :ok, true
      else
        unprocessable_entity @health_condition
      end
    end

    # DELETE /health_conditions/1
    def destroy
      @health_condition.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_health_condition
      @health_condition = if params[:individual_registration_id]
                            HealthCondition
                              .find_by(individual_registration_id: params[:individual_registration_id])
                          else
                            HealthCondition.find(params[:id])
                          end
    end

    # Only allow a trusted parameter "white list" through.
    def health_condition_params
      params.require(:health_condition).permit(:individual_registration_id,
                                               :hospitalization_cause,
                                               :other_condition_one,
                                               :other_condition_two,
                                               :other_condition_three,
                                               :medicinal_plants_used,
                                               :maternity_reference,
                                               :weight_situation_id,
                                               :alcohol_dependent,
                                               :other_drugs_dependent,
                                               :smoker,
                                               :pregnant,
                                               :bedridden,
                                               :domiciled,
                                               :diabetic,
                                               :respiratory,
                                               :hypertension,
                                               :cancer,
                                               :kidneys,
                                               :leprosy,
                                               :tuberculosis,
                                               :avc_stroke,
                                               :had_heart_attack,
                                               :had_heart_disease,
                                               :recently_hospitalized,
                                               :mental_issue,
                                               :integrative_practices,
                                               :medicinal_plants,
                                               health_condition_hearts_attributes: %i[
                                                 id
                                                 disease_type_id
                                                 _destroy
                                               ],
                                               health_condition_respiratories_attributes: %i[
                                                 id
                                                 disease_type_id
                                                 _destroy
                                               ],
                                               health_condition_kidneys: %i[
                                                 id
                                                 kidney_problem_id
                                                 _destroy
                                               ])
    end
  end
end
