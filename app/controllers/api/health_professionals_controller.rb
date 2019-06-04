# frozen_string_literal: true

module Api
  class HealthProfessionalsController < Api::ApiController
    before_action :set_health_professional, only: %i[show edit update destroy]

    # GET /health_professionals
    def index
      @query = HealthProfessional.ransack(params[:q])
      @health_professionals = @query.result
      if params[:professional_team_id]
        @health_professionals = @health_professionals.where(professional_team_id: params[:professional_team_id])
      end
      if params[:health_establishment_id]
        @health_professionals = @health_professionals.where(health_establishment_id: params[:health_establishment_id])
      end
      render_json @health_professionals.includes(:cbo_code,
                                                 :professional_team,
                                                 :health_establishment)
    end

    # GET /health_professionals/1
    def show; end

    # GET /health_professionals/new
    def new
      @health_professional = HealthProfessional.new
    end

    # GET /health_professionals/1/edit
    def edit; end

    # POST /health_professionals
    def create
      @health_professional = HealthProfessional.new(health_professional_params)
      @cbo_selected = @health_professional.cbo_code.presence

      if @health_professional.save
        render_json @health_professional, :created
      else
        unprocessable_entity @health_professional
      end
    end

    # PATCH/PUT /health_professionals/1
    def update
      if @health_professional.update(health_professional_params)
        render_json @health_professional, :ok, true
      else
        unprocessable_entity @health_professional
      end
    end

    # DELETE /health_professionals/1
    def destroy
      @health_professional.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_health_professional
      @health_professional = HealthProfessional.friendly.find(params[:id])
      @cbo_selected = @health_professional.cbo_code.presence if @health_professional
    end

    # Only allow a trusted parameter "white list" through.
    def health_professional_params
      params.require(:health_professional).permit(:cns_code,
                                                  :cbo_code_id,
                                                  :legal_full_name, :fancy_name,
                                                  :federal_registry, :state_registry,
                                                  :health_establishment_id, :professional_team_id)
    end
  end

end
