# frozen_string_literal: true

module Api
  class InStreetSituationsController < Api::ApiController
    before_action :set_in_street_situation, only: %i[show update destroy]

    # GET /in_street_situations/1
    def show
      render_json @in_street_situation
    end

    # POST /in_street_situations
    def create
      @in_street_situation = InStreetSituation.new(in_street_situation_params)

      if @in_street_situation.save
        render_json @in_street_situation, :created
      else
        unprocessable_entity @in_street_situation
      end
    end

    # PATCH/PUT /in_street_situations/1
    def update
      if @in_street_situation.update(in_street_situation_params)
        render_json @in_street_situation, :ok, true
      else
        unprocessable_entity @in_street_situation
      end
    end

    # DELETE /in_street_situations/1
    def destroy
      @in_street_situation.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_in_street_situation
      @in_street_situation = if params[:individual_registration_id]
                               InStreetSituation.find_by(individual_registration_id: params[:individual_registration_id])
                             else
                               InStreetSituation.friendly.find(params[:id])
                             end
    end

    # Only allow a trusted parameter "white list" through.
    def in_street_situation_params
      params.require(:in_street_situation).permit(:kinship_degree,
                                                  :other_accompanied,
                                                  :meals_per_day_id,
                                                  :has_other_accompanied,
                                                  :familiar_reference,
                                                  :receive_benefits,
                                                  :in_street_situation,
                                                  :has_personal_hygiene,
                                                  :family_visit,
                                                  :street_situation_time_id)
    end
  end
end
