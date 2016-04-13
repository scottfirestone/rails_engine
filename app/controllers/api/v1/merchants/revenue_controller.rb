module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        respond_to :json

        def show
          response = Merchant.find(params[:id]).revenue
          respond_with response
        end
      end
    end
  end
end
