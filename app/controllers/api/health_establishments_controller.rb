# frozen_string_literal: true

module Api
  class HealthEstablishmentsController < Api::ApiController
    before_action :set_health_establishment, only: %i[show edit update destroy]

    # GET /health_establishments
    def index
      @query = HealthEstablishment.ransack(params[:q])
      render_json @query.result.page(params[:page])
    end

    # GET /health_establishments/1
    def show; end

    # GET /health_establishments/new
    def new
      @health_establishment = HealthEstablishment.new
    end

    # GET /health_establishments/1/edit
    def edit; end

    # POST /health_establishments
    def create
      @health_establishment = HealthEstablishment.new(health_establishment_params)

      if @health_establishment.save
        render_json @health_establishment, :created
      else
        unprocessable_entity @health_establishment
      end
    end

    # PATCH/PUT /health_establishments/1
    def update
      if @health_establishment.update(health_establishment_params)
        render_json @health_establishment, :ok, true
      else
        unprocessable_entity @health_establishment
      end
    end

    # DELETE /health_establishments/1
    def destroy
      @health_establishment.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_health_establishment
      @health_establishment = HealthEstablishment.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def health_establishment_params
      params.require(:health_establishment).permit(:cnes_code, :unit_code,
                                                   :legal_full_name, :fancy_name,
                                                   :federal_registry, :state_registry,
                                                   :manager_full_name, :manager_federal_registry,
                                                   :registry_at, :unit_type_id)
    end
  end

end
