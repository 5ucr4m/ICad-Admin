# frozen_string_literal: true

class VaccinationsController < WebController
  load_and_authorize_resource find_by: :slug
  before_action :set_vaccination, only: %i[show edit update destroy]

  breadcrumb Vaccination.model_name.human(count: 2), :vaccinations_path

  # GET /vaccinations
  def index
    @query = Vaccination.ransack(params[:q])
    @result = @query.result
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @vaccinations = pagy(@result.includes(:vaccination_campaign, :family_member),
                                page: params[:page], items: 10)
  end

  # GET /vaccinations/1
  def show
    breadcrumb @vaccination.slug, vaccinations_path(@vaccinations)
  end

  # GET /vaccinations/new
  def new
    breadcrumb t('helpers.submit.new'), new_vaccination_path
    @vaccination = Vaccination.new
  end

  # GET /vaccinations/1/edit
  def edit
    breadcrumb @vaccination.slug, vaccination_path(@vaccination)
  end

  # POST /vaccinations
  def create
    breadcrumb t('helpers.submit.new'), new_vaccination_path
    @vaccination = current_user.vaccinations.build(vaccination_params)

    if @vaccination.save
      redirect_to vaccinations_url, notice: 'Vaccination was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vaccinations/1
  def update
    breadcrumb @vaccination.slug, vaccination_path(@vaccination)
    if @vaccination.update(vaccination_params)
      redirect_to vaccinations_url, notice: 'Vaccination was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vaccinations/1
  def destroy
    @vaccination.destroy
    redirect_to vaccinations_url, notice: 'Vaccination was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vaccination
    @vaccination = Vaccination.friendly.find(params[:id])
    @family_member = @vaccination.family_member.presence
  end

  # Only allow a trusted parameter "white list" through.
  def vaccination_params
    params.require(:vaccination).permit(:uuid, :tp_cds_origin, :patient_type,
                                        :header_transport_id, :vaccination_campaign_id,
                                        :turn_id, :family_member_id, :local_service_id,
                                        :traveller, :leprosy_communicant, :pregnant,
                                        :puerperal, :initial_date_hour, :final_date_hour,
                                        vaccination_vaccines_attributes: %i[
                                          id
                                          vaccine_id
                                          _destroy
                                        ])
  end
end
