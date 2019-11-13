# frozen_string_literal: true

class VaccinationCampaignsController < WebController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: :update_map
  before_action :set_vaccination_campaign, only: %i[show edit update update_map destroy]

  breadcrumb VaccinationCampaign.model_name.human(count: 2), :vaccination_campaigns_path

  # GET /vaccination_campaigns
  def index
    @query = VaccinationCampaign.ransack(params[:q])
    @pagy, @vaccination_campaigns = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /vaccination_campaigns/1
  def show
    breadcrumb @vaccination_campaign.slug, vaccination_campaign_path(@vaccination_campaign)
  end

  # GET /vaccination_campaigns/new
  def new
    breadcrumb "#{t('helpers.submit.new')} #{VaccinationCampaign.model_name.human}", new_vaccination_campaign_path
    @vaccination_campaign = VaccinationCampaign.new
  end

  # GET /vaccination_campaigns/1/edit
  def edit
    breadcrumb @vaccination_campaign.slug, vaccination_campaign_path(@vaccination_campaign)
  end

  # POST /vaccination_campaigns
  def create
    breadcrumb "#{t('helpers.submit.new')} #{VaccinationCampaign.model_name.human}", new_vaccination_campaign_path
    @vaccination_campaign = VaccinationCampaign.new(vaccination_campaign_params)

    if @vaccination_campaign.save
      redirect_to @vaccination_campaign, notice: 'Vaccination campaign was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vaccination_campaigns/1
  def update
    if @vaccination_campaign.update(vaccination_campaign_params)
      redirect_to @vaccination_campaign, notice: 'Vaccination campaign was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vaccination_campaigns/1
  def destroy
    @vaccination_campaign.destroy
    redirect_to vaccination_campaigns_url, notice: 'Vaccination campaign was successfully destroyed.'
  end

  def update_map
    render_json @vaccination_campaign.vaccinations
                                     .includes(:company, :local_service, :turn,
                                               :header_transport,
                                               family_member: [:gender, family: [:home_registration]])
                                     .where(patient_type: params[:filter_by])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vaccination_campaign
    @vaccination_campaign = VaccinationCampaign.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vaccination_campaign_params
    params.require(:vaccination_campaign).permit(:title, :description,
                                                 :period_start, :period_end,
                                                 :age_initial, :age_end)
  end
end
