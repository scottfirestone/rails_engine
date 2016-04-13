module Api
  module V1
    module Merchants
      class RevenueController < ApiController
        respond_to :json

        def show
          revenue = Merchant.find(params[:id]).
            invoices.
            joins(:transactions, :invoice_items).
            where(transactions: { result: "success" }).
            sum("invoice_items.unit_price * invoice_items.quantity")
          revenue = '%.02f' % (revenue / 100.0)
          response = { "revenue" => "#{revenue}"}
          respond_with response
        end
      end
    end
  end
end
