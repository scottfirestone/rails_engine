module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApiController
        respond_to :json

        def show
          response = Merchant.find(params[:id]).favorite_customer
          respond_with response, root: false
        end
      end
    end
  end
end
