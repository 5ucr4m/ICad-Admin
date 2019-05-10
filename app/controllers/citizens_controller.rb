class CitizensController < ApplicationController
  before_action :set_citizen, only: %i[show edit update destroy]

  # GET /citizens
  def index
    @query = Citizen.ransack(params[:q])
    @pagy, @citizens = pagy(@query.result, page: params[:page])
  end

  # GET /citizens/1
  def show
  end

  # GET /citizens/new
  def new
    @citizen = Citizen.new
  end

  # GET /citizens/1/edit
  def edit
  end

  # POST /citizens
  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      redirect_to @citizen, notice: 'Citizen was successfully created.', status: :created
    else
      unprocessable_entity @citizen
    end
  end

  # PATCH/PUT /citizens/1
  def update
    if @citizen.update(citizen_params)
      redirect_to @citizen, notice: 'Citizen was successfully updated.'
    else
      unprocessable_entity @citizen
    end
  end

  # DELETE /citizens/1
  def destroy
    @citizen.destroy
    redirect_to citizens_url, notice: 'Citizen was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citizen
      @citizen = Citizen.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def citizen_params
      params.require(:citizen).permit(:registry_id, :gender_id, :race_id, :birth_state_id, :nationality_id, :birth_date, :birth_country_id, :mother_name, :sus_card_number, :pis_pasep_number, :unknown_mother_name, :responsible_person_id, :health_condition_id, :company_id, :slug)
    end
end
