module Api
  module V1
    class CustomersController < ApiController
      respond_to :json

      def index
        respond_with Customer.all, root: false
      end

      def show
        respond_with Customer.find(params[:id])
      end
    end
  end
end
