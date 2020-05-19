# frozen_string_literal: true

class GenericModelsController < WebController
  before_action :set_generic_model, only: %i[show edit update destroy]
  before_action :set_query, except: %i[index new create show edit update destroy]

  # GET /generic_models
  def index
    authorize(GenericModel)
    @query = GenericModel.ransack(params[:q])
    @pagy, @generic_models = pagy(@query.result, page: params[:page], items: 10)
  end

  def address_types
    authorize(GenericModel)
    render_json(@result.address_types)
  end

  def cbo_types
    authorize(GenericModel)
    render_json(@result.cbo_types)
  end

  def ethnicity_types
    authorize(GenericModel)
    render_json(@result.ethnicities)
  end

  def carried_procedures
    authorize(GenericModel)
    render_json(@result.carried_procedures)
  end

  def exams
    authorize(GenericModel)
    render_json(@result.exams)
  end

  def pharmaceutical_forms
    authorize(GenericModel)
    render_json(@result.pharmaceutical_forms)
  end

  def collected_times
    authorize(GenericModel)
    render_json(@result.collected_times)
  end

  def duration_types
    authorize(GenericModel)
    render_json(@result.duration_types)
  end

  def dose_frequency_types
    authorize(GenericModel)
    render_json(@result.dose_frequency_types)
  end

  def specialties
    authorize(GenericModel)
    render_json(@result.specialties)
  end

  # GET /generic_models/1
  def show
    authorize(@generic_model)
  end

  # GET /generic_models/new
  def new
    authorize(@generic_model)
    @generic_model = GenericModel.new
  end

  # GET /generic_models/1/edit
  def edit
    authorize(@generic_model)
  end

  # POST /generic_models
  def create
    authorize(GenericModel)
    @generic_model = GenericModel.new(generic_model_params)

    if @generic_model.save
      redirect_to(@generic_model, notice: 'Generic model was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /generic_models/1
  def update
    authorize(@generic_model)
    if @generic_model.update(generic_model_params)
      redirect_to(@generic_model, notice: 'Generic model was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /generic_models/1
  def destroy
    authorize(@generic_model)
    @generic_model.destroy
    redirect_to(generic_models_url, notice: 'Generic model was successfully destroyed.')
  end

  private

  def set_query
    @query = GenericModel.ransack(params[:q])
    @result = @query.result.includes(:generic_model)
  end

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
