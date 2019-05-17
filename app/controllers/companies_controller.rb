# frozen_string_literal: true

class CompaniesController < WebController
  before_action :set_company, only: %i[show edit update destroy]

  # GET /companies
  def index
    @query = Company.ransack(params[:q])
    @pagy, @companies = pagy(@query.result, page: params[:page])
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
  end

  # Only allow a trusted parameter "white list" through.
  def company_params
    params.require(:company).permit(:registry_id, :slug)
  end
end
