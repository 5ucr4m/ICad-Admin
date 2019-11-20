class ReportsController < WebController

  breadcrumb 'Relatórios', :root_path

  def families
    @search_params = []
    @query = Family.ransack(params[:query])
    @result = @query.result
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def family_members
    @search_params = []
    @query = Family.ransack(params[:query])
    @result = @query.result
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def individual_registrations
    @search_params = []
    @query = Family.ransack(params[:query])
    @result = @query.result
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def home_registrations
    @search_params = []
    @query = Family.ransack(params[:query])
    @result = @query.result
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end

  def home_visit_registrations
    @search_params = []
    @query = Family.ransack(params[:query])
    @result = @query.result
    @pagy, @list = pagy(@result, page: params[:page], items: 10)
  end
end
