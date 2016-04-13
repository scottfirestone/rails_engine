module Api
  module V1
    module Merchants
      class CustomersWithPendingInvoicesController < ApiController
        respond_to :json

        def show
          response = Merchant.find(params[:id]).customers_with_pending_invoices
          respond_with response, root: false
        end
      end
    end
  end
end
