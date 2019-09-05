# frozen_string_literal: true

class HomeVisitFormsController < WebController
  before_action :set_home_visit_form, only: %i[show edit update destroy]

  # GET /home_visit_forms
  def index
    @query = HomeVisitForm.ransack(params[:q])
    @pagy, @home_visit_forms = pagy(@query.result, page: params[:page])
  end

  # GET /home_visit_forms/1
  def show; end

  # GET /home_visit_forms/new
  def new
    @home_visit_form = HomeVisitForm.new
  end

  # GET /home_visit_forms/1/edit
  def edit; end

  # POST /home_visit_forms
  def create
    @home_visit_form = HomeVisitForm.new(home_visit_form_params)

    if @home_visit_form.save
      redirect_to @home_visit_form, notice: 'Home visit form was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /home_visit_forms/1
  def update
    if @home_visit_form.update(home_visit_form_params)
      redirect_to @home_visit_form, notice: 'Home visit form was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /home_visit_forms/1
  def destroy
    @home_visit_form.destroy
    redirect_to home_visit_forms_url, notice: 'Home visit form was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_home_visit_form
    @home_visit_form = HomeVisitForm.friendly.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def home_visit_form_params
    params.require(:home_visit_form).permit(:turn_id,
                                            :handbook_number,
                                            :cns_number,
                                            :birth_date,
                                            :gender_id,
                                            :other_visit,
                                            :outcome_id,
                                            :micro_area,
                                            :out_area,
                                            :home_type_id,
                                            :weight_monitoring,
                                            :height_monitoring,
                                            home_visit_registration_attributes: %i[
                                              family_member_id
                                              uuid
                                              tp_cds_origin
                                            ])
  end
end
