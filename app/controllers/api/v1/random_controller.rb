module Api
  module V1
    class RandomController < ApiController
      respond_to :json

      def show
        attr_mapper
        respond_with @model.order("RANDOM()").first
      end
    end
  end
end
