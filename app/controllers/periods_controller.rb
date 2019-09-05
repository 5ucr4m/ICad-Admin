# frozen_string_literal: true

class PeriodsController < ApplicationController
  before_action :set_period, only: %i[show edit update destroy]

  # GET /periods
  def index
    @query = Period.ransack(params[:q])
    @pagy, @periods = pagy(@query.result, page: params[:page])
  end

  # GET /periods/1
  def show; end

  # GET /periods/new
  def new
    @period = Period.new
  end

  # GET /periods/1/edit
  def edit; end

  # POST /periods
  def create
    @period = Period.new(period_params)

    if @period.save
      redirect_to @period, notice: 'Period was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /periods/1
  def update
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_period
    @period = Period.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def period_params
    params.require(:period).permit(:competence, :start_date, :end_date, :deadline, :company_id, :slug)
  end
end
