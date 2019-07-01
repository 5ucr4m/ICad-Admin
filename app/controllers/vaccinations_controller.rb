class VaccinationsController < ApplicationController
  before_action :set_vaccination, only: %i[show edit update destroy]

  # GET /vaccinations
  def index
    @query = Vaccination.ransack(params[:q])
    @pagy, @vaccinations = pagy(@query.result, page: params[:page])
  end

  # GET /vaccinations/1
  def show
  end

  # GET /vaccinations/new
  def new
    @vaccination = Vaccination.new
  end

  # GET /vaccinations/1/edit
  def edit
  end

  # POST /vaccinations
  def create
    @vaccination = Vaccination.new(vaccination_params)

    if @vaccination.save
      redirect_to @vaccination, notice: 'Vaccination was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vaccinations/1
  def update
    if @vaccination.update(vaccination_params)
      redirect_to @vaccination, notice: 'Vaccination was successfully updated.'
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
    end

    # Only allow a trusted parameter "white list" through.
    def vaccination_params
      params.require(:vaccination).permit(:uuid, :tp_cds_origin, :company_id, :slug)
    end
end
