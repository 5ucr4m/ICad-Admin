# frozen_string_literal: true

module Api
  class AddressesController < Api::ApiController
    before_action :set_address, only: %i[show update destroy]

    # GET /addresses/1
    def show
      authorize(@address)
      render_json(@address)
    end

    # POST /addresses
    def create
      authorize(Address)
      @address = Addresses.new(address_params)

      if @address.save
        render_json(@address, :created)
      else
        unprocessable_entity(@address)
      end
    end

    # PATCH/PUT /addresses/1
    def update
      authorize(@address)
      if @address.update(address_params)
        render_json(@address, :ok, true)
      else
        unprocessable_entity(@address)
      end
    end

    # DELETE /addresses/1
    def destroy
      authorize(@address)
      @address.destroy
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = if params[:home_registration_id]
        Address
          .find_by(home_registration_id: params[:home_registration_id])
      else
        Address.find(params[:id])
                 end
    end

    # Only allow a trusted parameter "white list" through.
    def address_params
      params.require(:address).permit(:address_type_id,
                                      :patio,
                                      :number,
                                      :zip,
                                      :complement,
                                      :district,
                                      :city_id,
                                      :referential_phone,
                                      :home_phone,
                                      :reference,
                                      :out_area,
                                      :micro_area,
                                      :home_registration)
    end
  end
end
