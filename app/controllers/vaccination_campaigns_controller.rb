# frozen_string_literal: true

class VaccinationCampaignsController < WebController
  load_and_authorize_resource
  before_action :set_vaccination_campaign, only: %i[show edit update destroy]

  # GET /vaccination_campaigns
  def index
    @query = VaccinationCampaign.by_company(current_user.company).ransack(params[:q])
    @pagy, @vaccination_campaigns = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /vaccination_campaigns/1
  def show; end

  # GET /vaccination_campaigns/new
  def new
    @vaccination_campaign = VaccinationCampaign.new
  end

  # GET /vaccination_campaigns/1/edit
  def edit; end

  # POST /vaccination_campaigns
  def create
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vaccination_campaign
    @vaccination_campaign = VaccinationCampaign.by_company(current_user.company).friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vaccination_campaign_params
    params.require(:vaccination_campaign).permit(:title, :description, :newborn,
                                                 :child, :woman, :period_start,
                                                 :period_end, :age_initial,
                                                 :age_end, :company_id, :slug)
  end
end
