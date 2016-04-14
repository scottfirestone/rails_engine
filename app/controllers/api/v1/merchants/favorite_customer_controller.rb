module Api
  module V1
    module Merchants
      class FavoriteCustomerController < ApiController
        respond_to :json

        def show
          favorite_customer_id = Merchant.find(params[:id]).favorite_customer
          customer = Customer.find(favorite_customer_id)
          respond_with customer, root: false
        end
      end
    end
  end
end
