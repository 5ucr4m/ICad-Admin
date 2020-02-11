# frozen_string_literal: true
class MedicinesController < WebController
  before_action :set_medicine, only: %i[show edit update destroy]

  breadcrumb Medicine.model_name.human(count: 2), :medicines_path

  # GET /medicines
  def index
    authorize(Medicine)
    @query = Medicine.ransack(params[:q])
    @pagy, @medicines = pagy(@query.result, page: params[:page], items: 10)
  end

  # GET /medicines/1
  def show
    authorize(@medicine)
    breadcrumb(@medicine.slug, medicine_path(@medicine))
  end

  # GET /medicines/new
  def new
    authorize(Medicine)
    breadcrumb(t('helpers.submit.new'), new_medicine_path)
    @medicine = Medicine.new
  end

  # GET /medicines/1/edit
  def edit
    authorize(@medicine)
    breadcrumb(@medicine.slug, medicine_path(@medicine))
  end

  # POST /medicines
  def create
    authorize(Medicine)
    breadcrumb(t('helpers.submit.new'), new_medicine_path)
    @medicine = Medicine.new(medicine_params)

    if @medicine.save
      redirect_to(@medicine, notice: 'Medicine was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /medicines/1
  def update
    authorize(Medicine)
    breadcrumb(@medicine.slug, medicine_path(@medicine))
    if @medicine.update(medicine_params)
      redirect_to(@medicine, notice: 'Medicine was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /medicines/1
  def destroy
    authorize(@medicine)
    @medicine.destroy
    redirect_to(medicines_url, notice: 'Medicine was successfully destroyed.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_medicine
    @medicine = Medicine.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def medicine_params
    params.require(:medicine).permit(:substance, :laboratory, :laboratory_registry,
                                     :ggrem_code, :registry, :ean_one, :ean_two, :ean_three,
                                     :active_principle, :therapeutic_class_id, :product_type_id,
                                     :stripe_id)
  end
end
