module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        respond_to :json

        def show
          if params[:date]
            date = Time.zone.parse(params[:date])
            response = Merchant.find(params[:id]).revenue_by_date(date)
          else
            response = Merchant.find(params[:id]).revenue
          end
          respond_with response
        end
      end
    end
  end
end
