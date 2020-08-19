# frozen_string_literal: true
require 'net/http'

class UsersController < WebController
  before_action :set_user, only: %i[show edit update destroy]

  breadcrumb User.model_name.human(count: 2), :users_path

  # GET /users
  def index
    authorize(User)
    @query = User.ransack(params[:q])
    @pagy, @users = pagy(@query.result
                             .includes(
                               health_professional: [:professional_team]
                             ),
                         page: params[:page], items: 10)
  end

  # GET /users/1
  def show
    authorize(@user)
    breadcrumb(@user.slug, user_path(@user))
  end

  # GET /users/new
  def new
    authorize(User)
    breadcrumb(t('helpers.submit.new'), new_user_path)
    @user = User.new
    @user.build_health_professional
  end

  # GET /users/1/edit
  def edit
    authorize(@user)
    breadcrumb(@user.slug, user_path(@user))
  end

  # POST /users
  def create

    puts "00000000-------000000"
    puts params.to_json
    puts "00000000-------000000"
    puts user_params.to_json
    puts "00000000-------000000"

    authorize(User)
    @user = User.new(user_params)
    @user.avatar.attach(params[:avatar])

    parsed_json = ActiveSupport::JSON.decode(params.to_json)


    @cbo_selected = @user&.health_professional&.cbo_code&.presence

    if @user.save

      parsed_json["user"]["user_roles_attributes"].each { |value|
        user_role = UserRole.new
        user_role.user = @user
        user_role.company_id = value[1]["company_id"]
        user_role.role_id = value[1]["role_id"]
        user_role.save
      }

      url = "http://192.168.15.10:9000/employer"
      uri = URI(url)
      http = Net::HTTP.new(uri.host, uri.port)
      form_data = {
          email: "l.eduardosoares@gmail.com",
          password: "1234567",
          token:  ::Digest::MD5.hexdigest( "l.eduardosoares@gmail.commvcssc3l1234567")
      }
      request = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
      request.body = form_data.to_json
      http.request(request)

      redirect_to(users_url, notice: 'Usuário foi criado com sucesso.')
    else
      render(:new)
    end
  end

  # PATCH/PUT /users/1
  def update
    authorize(@user)

    parsed_json = ActiveSupport::JSON.decode(params.to_json)

    if @user.update(user_params)

      @user.user_roles.delete_all

      parsed_json["user"]["user_roles_attributes"].each { |value|
        user_role = UserRole.new
        user_role.user = @user
        user_role.company_id = value[1]["company_id"]
        user_role.role_id = value[1]["role_id"]
        user_role.save
      } unless parsed_json["user"]["user_roles_attributes"].nil?

      @user.avatar.attach(params[:avatar]) unless @user.avatar.attached?
      redirect_to(users_url, notice: 'Usuário foi atualizado com sucesso.')
    else
      @cbo_selected = @user&.health_professional&.cbo_code&.presence
      render(:edit)
    end
  end

  # DELETE /users/1
  def destroy
    authorize(@user)
    @user.destroy
    redirect_to(users_url, notice: 'Usuário foi removido com sucesso.')
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.where(slug: params[:id]).includes(:user_roles).first
    @cbo_selected = @user&.health_professional&.cbo_code&.presence
    unless @user&.health_professional&.persisted?
      @user.build_health_professional
    end
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email,
                                 :password,
                                 :password_confirmation,
                                 :avatar,
                                 :health_professional_id,
                                 user_companies_attributes: [
                                   :id,
                                   :user_id,
                                   :company_id,
                                   :current,
                                   :_destroy,
                                   user_roles_attributes: %i[
                                     id
                                     role_id
                                   ],
                                 ])
  end
end
