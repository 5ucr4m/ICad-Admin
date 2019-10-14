# frozen_string_literal: true

class HealthProfessionalsController < WebController
  load_and_authorize_resource
  before_action :set_health_professional, only: %i[show edit update destroy]
  before_action :set_relationships, except: %i[index destroy]

  # GET /health_professionals
  def index
    @query = HealthProfessional.by_company(current_user.company).ransack(params[:q])
    @pagy, @health_professionals = pagy(@query.result.includes(:cbo_code,
                                                               :professional_team,
                                                               :health_establishment), page: params[:page], items: 10)
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
      @cbo_selected = @health_professional.cbo_code.presence
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
    @health_professional = HealthProfessional.by_company(current_user.company).friendly.find(params[:id])
    @cbo_selected = @health_professional.cbo_code.presence
  end

  def set_relationships
    @professional_teams = ProfessionalTeam.by_company(current_user.company)
    @health_establishments = HealthEstablishment.by_company(current_user.company)
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
