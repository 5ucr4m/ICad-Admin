# frozen_string_literal: true

class CompaniesController < WebController
  before_action :set_company, only: %i[show edit update destroy]

  # GET /companies
  def index
    @query = Company.ransack(params[:q])
    @pagy, @companies = pagy(@query.result.includes(:city)
                               .order(id: :desc), page: params[:page], items: 10)
  end

  # GET /companies/1
  def show; end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit; end

  # POST /companies
  def create
    @company = Company.new(company_params)
    @city_selected = @company.city.presence
    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.friendly.find(params[:id])
    @city_selected = @company.city.presence
  end

  # Only allow a trusted parameter "white list" through.
  def company_params
    params.require(:company).permit(:legal_full_name, :fancy_name,
                                    :federal_registry, :state_registry,
                                    :patio, :number, :zip, :reference,
                                    :district, :city_id, :complement)
  end
end
