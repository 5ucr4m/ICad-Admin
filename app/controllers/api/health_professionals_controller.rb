# frozen_string_literal: true

module Api
  class HealthProfessionalsController < Api::ApiController
    before_action :set_health_professional, only: %i[show edit update destroy]

    # GET /health_professionals
    def index
      @query = HealthProfessional.ransack(params[:q])
      @pagy, @health_professionals = pagy(@query.result.includes(:cbo_code,
                                                                 :professional_team,
                                                                 :health_establishment), page: params[:page])
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
        redirect_to @health_professional, notice: 'Health professional was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /health_professionals/1
    def update
      if @health_professional.update(health_professional_params)
        redirect_to @health_professional, notice: 'Health professional was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /health_professionals/1
    def destroy
      @health_professional.destroy
      redirect_to health_professionals_url, notice: 'Health professional was successfully destroyed.'
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
