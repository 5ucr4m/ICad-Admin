# frozen_string_literal: true

class FamiliesController < WebController
  before_action :set_family, only: %i[show edit update destroy]

  # GET /families
  def index
    @query = Family.ransack(params[:q])
    @pagy, @families = pagy(@query.result, page: params[:page])
  end

  # GET /families/1
  def show; end

  # GET /families/new
  def new
    @family = Family.new
    @family.build_home_registration
  end

  # GET /families/1/edit
  def edit; end

  # POST /families
  def create
    @family = Family.new(family_params)

    if @family.save
      redirect_to @family, notice: 'Family was successfully created.', status: :created
    else
      render :new
    end
  end

  # PATCH/PUT /families/1
  def update
    if @family.update(family_params)
      redirect_to @family, notice: 'Family was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /families/1
  def destroy
    @family.destroy
    redirect_to families_url, notice: 'Family was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_family
    @family = Family.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def family_params
    params.require(:family).permit(:responsible_birth_date,
                                   :responsible_cns_number,
                                   :members_quantity, :handbook_number,
                                   :family_income_cents, :reside_since,
                                   :moving,
                                   home_registration: %i[
                                     id
                                     health_professional_id
                                   ])
  end
end
