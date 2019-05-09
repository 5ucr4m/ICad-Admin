# frozen_string_literal: true

class HealthEstablishmentsController < WebController
  before_action :set_health_establishment, only: %i[show edit update destroy]

  # GET /health_establishments
  def index
    @query = HealthEstablishment.ransack(params[:q])
    @pagy, @health_establishments = pagy(@query.result, page: params[:page])
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
      redirect_to @health_establishment, notice: 'Health establishment was successfully created.', status: :created
    else
      unprocessable_entity @health_establishment
    end
  end

  # PATCH/PUT /health_establishments/1
  def update
    if @health_establishment.update(health_establishment_params)
      redirect_to @health_establishment, notice: 'Health establishment was successfully updated.'
    else
      unprocessable_entity @health_establishment
    end
  end

  # DELETE /health_establishments/1
  def destroy
    @health_establishment.destroy
    redirect_to health_establishments_url, notice: 'Health establishment was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_health_establishment
    @health_establishment = HealthEstablishment.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def health_establishment_params
    params.require(:health_establishment).permit(:cnes_code, :unit_code, :registry_id,
                                                 :registry_at, :manager_id, :unit_type_id,
                                                 :company_id, :slug)
  end
end
