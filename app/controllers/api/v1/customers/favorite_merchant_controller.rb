module Api
  module V1
    module Customers
      class FavoriteMerchantController < ApiController
        respond_to :json

        def show
          favorite_merchant_id = Customer.find(params[:id]).favorite_merchant
          merchant = Merchant.find(favorite_merchant_id)
          respond_with merchant, root: false
        end
      end
    end
  end
end
