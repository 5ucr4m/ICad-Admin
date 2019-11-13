# frozen_string_literal: true

class PeriodsController < WebController
  load_and_authorize_resource
  before_action :set_period, only: %i[show edit update destroy export export_xml]

  breadcrumb Period.model_name.human(count: 2), :periods_path

  # GET /periods
  def index
    @query = Period.ransack(params[:q])
    @pagy, @periods = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /periods/1
  def show
    breadcrumb @period.slug, period_path(@period)
  end

  # GET /periods/new
  def new
    breadcrumb "#{t('helpers.submit.new')} #{Period.model_name.human}", new_period_path
    @period = Period.new
  end

  # GET /periods/1/edit
  def edit
    breadcrumb @period.slug, period_path(@period)
  end

  # POST /periods
  def create
    breadcrumb "#{t('helpers.submit.new')} #{Period.model_name.human}", new_period_path
    @period = Period.new(period_params)

    if @period.save
      redirect_to @period, notice: 'Period was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /periods/1
  def update
    breadcrumb @period.slug, period_path(@period)
    if @period.update(period_params)
      redirect_to @period, notice: 'Period was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /periods/1
  def destroy
    @period.destroy
    redirect_to periods_url, notice: 'Period was successfully destroyed.'
  end

  def export
    redirect_to @period if request.post?
  end

  def period_items
    @period_items = @period.period_items
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_period
    @period = Period.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def period_params
    params.require(:period).permit(:competence, :start_date, :end_date, :deadline)
  end
end
