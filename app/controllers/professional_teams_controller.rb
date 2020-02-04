# frozen_string_literal: true

class ProfessionalTeamsController < WebController
  before_action :set_professional_team, only: %i[show edit update destroy]

  breadcrumb ProfessionalTeam.model_name.human(count: 2), :professional_teams

  # GET /professional_teams
  def index
    authorize(ProfessionalTeam)
    @query = ProfessionalTeam.ransack(params[:q])
    @pagy, @professional_teams = pagy(@query.result.includes(:health_establishment), page: params[:page], items: 10)
  end

  # GET /professional_teams/1
  def show
    authorize(@professional_team)
    breadcrumb(@professional_team.slug, professional_team_path(@professional_team))
  end

  # GET /professional_teams/new
  def new
    authorize(ProfessionalTeam)
    breadcrumb(t('helpers.submit.new'), new_professional_team_path)
    @professional_team = ProfessionalTeam.new
  end

  # GET /professional_teams/1/edit
  def edit
    authorize(@professional_team)
    breadcrumb(@professional_team.slug, professional_team_path(@professional_team))
  end

  # POST /professional_teams
  def create
    authorize(ProfessionalTeam)
    breadcrumb(t('helpers.submit.new'), new_professional_team_path)
    @professional_team = ProfessionalTeam.new(professional_team_params)

    if @professional_team.save
      redirect_to(professional_teams_url, notice: 'Professional team was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /professional_teams/1
  def update
    authorize(@professional_team)
    breadcrumb(@professional_team.slug, professional_team_path(@professional_team))
    if @professional_team.update(professional_team_params)
      redirect_to(professional_teams_url, notice: 'Professional team was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /professional_teams/1
  def destroy
    authorize(@professional_team)
    @professional_team.destroy
    redirect_to(professional_teams_url, notice: 'Professional team was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_professional_team
    @professional_team = ProfessionalTeam.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def professional_team_params
    params.require(:professional_team).permit(:name, :code, :active, :health_establishment_id)
  end
end
