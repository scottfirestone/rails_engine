module Api
  module V1
    class ItemsController < ApiController
      respond_to :json

      def index
        respond_with Item.all, root: false
      end

      def show
        respond_with Item.find(params[:id]), root: false
      end
    end
  end
end
