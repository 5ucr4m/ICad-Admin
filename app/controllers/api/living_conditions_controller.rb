# frozen_string_literal: true

module Api
  class LivingConditionsController < Api::ApiController
    before_action :set_living_condition, only: %i[show update destroy]

    # GET /living_conditions/1
    def show
      authorize(@living_condition)
      render_json(@living_condition)
    end

    # POST /living_conditions
    def create
      authorize(LivingCondition)
      @living_condition = LivingCondition.new(living_condition_params)

      if @living_condition.save
        render_json(@living_condition, :created)
      else
        unprocessable_entity(@living_condition)
      end
    end

    # PATCH/PUT /living_conditions/1
    def update
      authorize(@living_condition)
      if @living_condition.update(living_condition_params)
        render_json(@living_condition, :ok, true)
      else
        unprocessable_entity(@living_condition)
      end
    end

    # DELETE /living_conditions/1
    def destroy
      authorize(@living_condition)
      @living_condition.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_living_condition
      @living_condition = if params[:home_registration_id]
        LivingCondition
          .find_by(home_registration_id: params[:home_registration_id])
      else
        LivingCondition.find(params[:id])
                          end
    end

    # Only allow a trusted parameter "white list" through.
    def living_condition_params
      params.require(:living_condition).permit(:home_registration_id,
                                               :water_supply_id,
                                               :rural_production_area_id,
                                               :garbage_disposal_id,
                                               :bathroom_drainage_id,
                                               :home_location_id,
                                               :home_wall_material_id,
                                               :rooms,
                                               :residents,
                                               :home_situation_id,
                                               :electric_power,
                                               :home_access_id,
                                               :home_type_id,
                                               :water_treatment_id)
    end
  end
end
