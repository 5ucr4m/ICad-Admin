# frozen_string_literal: true

class HomeVisitFormsController < WebController
  before_action :set_home_visit_form, only: %i[show edit update destroy]

  # GET /home_visit_forms
  def index
    authorize(HomeVisitForm)
    @query = HomeVisitForm.ransack(params[:q])
    @result = @query.result.includes(:company, :home_registration)
    @result = @result.where(user: current_user) if current_user.agent?
    @pagy, @home_visit_forms = pagy(@result, page: params[:page], items: 10)
  end

  # GET /home_visit_forms/1
  def show
    authorize(@home_visit_form)
  end

  # GET /home_visit_forms/new
  def new
    authorize(HomeVisitForm)
    @home_visit_form = HomeVisitForm.new
  end

  # GET /home_visit_forms/1/edit
  def edit
    authorize(@home_visit_form)
  end

  # POST /home_visit_forms
  def create
    authorize(HomeVisitForm)
    @home_visit_form = current_user.home_visit_forms.build(home_visit_form_params)

    if @home_visit_form.save
      redirect_to(home_visit_forms_url, notice: 'Home visit form was successfully created.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /home_visit_forms/1
  def update
    authorize(@home_visit_form)
    if @home_visit_form.update(home_visit_form_params)
      redirect_to(home_visit_forms_url, notice: 'Home visit form was successfully updated.')
    else
      render(:edit)
    end
  end

  # DELETE /home_visit_forms/1
  def destroy
    authorize(@home_visit_form)
    @home_visit_form.destroy
    redirect_to(home_visit_forms_url, notice: 'Home visit form was successfully destroyed.')
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
                                            :home_visit_registration_id,
                                            home_visit_reasons_attributes: %i[
                                              id
                                              reason_id
                                              _destroy
                                            ])
  end
end
