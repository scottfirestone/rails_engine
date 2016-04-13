module Api
  module V1
    class TransactionsController < ApiController
      respond_to :json

      def index
        respond_with Transaction.all, root: false
      end

      def show
        respond_with Transaction.find(params[:id])
      end
    end
  end
end
