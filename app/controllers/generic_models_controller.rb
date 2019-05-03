# frozen_string_literal: true

class GenericModelsController < WebController
  load_and_authorize_resource
  before_action :set_generic_model, only: %i[show edit update destroy]

  # GET /generic_models
  def index
    @query = GenericModel.ransack(params[:q])
    @pagy, @generic_models = pagy(@query.result, page: params[:page])
  end

  # GET /generic_models/1
  def show; end

  # GET /generic_models/new
  def new
    @generic_model = GenericModel.new
  end

  # GET /generic_models/1/edit
  def edit; end

  # POST /generic_models
  def create
    @generic_model = GenericModel.new(generic_model_params)

    if @generic_model.save
      redirect_to @generic_model, notice: 'Generic model was successfully created.', status: :created
    else
      unprocessable_entity @generic_model
    end
  end

  # PATCH/PUT /generic_models/1
  def update
    if @generic_model.update(generic_model_params)
      redirect_to @generic_model, notice: 'Generic model was successfully updated.'
    else
      unprocessable_entity @generic_model
    end
  end

  # DELETE /generic_models/1
  def destroy
    @generic_model.destroy
    redirect_to generic_models_url, notice: 'Generic model was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_generic_model
    @generic_model = GenericModel.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def generic_model_params
    params.require(:generic_model).permit(:name, :description, :reference,
                                          :generic_field, :generic_class,
                                          :generic_model_id)
  end
end
