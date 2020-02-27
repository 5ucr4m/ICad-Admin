# frozen_string_literal: true

class HealthProfessionalsController < WebController
  before_action :set_health_professional, only: %i[show edit update destroy]

  breadcrumb HealthProfessional.model_name.human(count: 2), :health_professionals_path

  # GET /health_professionals
  def index
    authorize(HealthProfessional)
    @query = HealthProfessional.ransack(params[:q])
    @pagy, @health_professionals = pagy(@query.result
                                          .includes(:cbo_code, :professional_team, :user),
                                        page: params[:page], items: 10)
  end

  # GET /health_professionals/1
  def show
    authorize(@health_professional)
    breadcrumb(@health_professional.slug, health_professional_path(@health_professional))
  end

  # GET /health_professionals/new
  def new
    authorize(HealthProfessional)
    breadcrumb("#{t('helpers.submit.new')} #{HealthProfessional.model_name.human}", new_health_professional_path)
    @health_professional = HealthProfessional.new
  end

  # GET /health_professionals/1/edit
  def edit
    authorize(@health_professional)
    breadcrumb(@health_professional.slug, health_professional_path(@health_professional))
  end

  # POST /health_professionals
  def create
    authorize(HealthProfessional)
    breadcrumb("#{t('helpers.submit.new')} #{HealthProfessional.model_name.human}", new_health_professional_path)
    @health_professional = HealthProfessional.new(health_professional_params)

    if @health_professional.save
      redirect_to(health_professionals_url, notice: 'Health professional was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /health_professionals/1
  def update
    authorize(@health_professional)
    breadcrumb(@health_professional.slug, health_professional_path(@health_professional))
    if @health_professional.update(health_professional_params)
      redirect_to(health_professionals_url, notice: 'Health professional was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /health_professionals/1
  def destroy
    authorize(@health_professional)
    @health_professional.destroy
    redirect_to(health_professionals_url, notice: 'Health professional was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_health_professional
    @health_professional = HealthProfessional.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def health_professional_params
    params.require(:health_professional).permit(:cns_code, :phone, :cbo_code_id, :full_name,
                                                :federal_registry, :state_registry,
                                                :professional_team_id, :user_id, :gender_id)
  end
end
