module Api
  module V1
    class InvoiceItemsController < ApiController
      respond_to :json

      def index
        respond_with InvoiceItem.all, root: false
      end

      def show
        respond_with InvoiceItem.find(params[:id]), root: false
      end
    end
  end
end
