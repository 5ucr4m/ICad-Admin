# frozen_string_literal: true

class VaccinesController < WebController
  before_action :set_vaccine, only: %i[show edit update destroy]

  breadcrumb Vaccine.model_name.human(count: 2), :vaccines_path

  # GET /vaccines
  def index
    @query = Vaccine.ransack(params[:q])
    @pagy, @vaccines = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /vaccines/1
  def show; end

  # GET /vaccines/new
  def new
    @vaccine = Vaccine.new
  end

  # GET /vaccines/1/edit
  def edit; end

  # POST /vaccines
  def create
    @vaccine = Vaccine.new(vaccine_params)

    if @vaccine.save
      redirect_to @vaccine, notice: 'Vaccine was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /vaccines/1
  def update
    if @vaccine.update(vaccine_params)
      redirect_to @vaccine, notice: 'Vaccine was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /vaccines/1
  def destroy
    @vaccine.destroy
    redirect_to vaccines_url, notice: 'Vaccine was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vaccine
    @vaccine = Vaccine.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vaccine_params
    params.require(:vaccine).permit(:description, :immunobiological_id,
                                    :vaccination_strategy_id, :dose_id,
                                    :lot_number, :manufacturer)
  end
end
