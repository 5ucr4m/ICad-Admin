# frozen_string_literal: true

class HealthEstablishmentsController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_health_establishment, only: %i[show edit update destroy]

  breadcrumb HealthEstablishment.model_name.human(count: 2), :health_establishments_path

  # GET /health_establishments
  def index
    @query = HealthEstablishment.ransack(params[:q])
    @pagy, @health_establishments = pagy(@query.result.includes(:unit_type), page: params[:page], items: 10)
  end

  # GET /health_establishments/1
  def show
    breadcrumb @health_establishment.slug, health_establishment_path(@health_establishment)
  end

  # GET /health_establishments/new
  def new
    breadcrumb "#{t('helpers.submit.new')}", new_health_establishment_path
    @health_establishment = HealthEstablishment.new
  end

  # GET /health_establishments/1/edit
  def edit
    breadcrumb @health_establishment.slug, health_establishment_path(@health_establishment)
  end

  # POST /health_establishments
  def create
    breadcrumb "#{t('helpers.submit.new')}", new_health_establishment_path
    @health_establishment = HealthEstablishment.new(health_establishment_params)

    if @health_establishment.save
      redirect_to @health_establishment, notice: 'Health establishment was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /health_establishments/1
  def update
    breadcrumb @health_establishment.slug, health_establishment_path(@health_establishment)
    if @health_establishment.update(health_establishment_params)
      redirect_to @health_establishment, notice: 'Health establishment was successfully updated.'
    else
      render :edit
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
    params.require(:health_establishment).permit(:cnes_code, :unit_code,
                                                 :legal_full_name, :fancy_name,
                                                 :federal_registry, :state_registry,
                                                 :manager_full_name, :manager_federal_registry,
                                                 :registry_at, :unit_type_id)
  end
end
