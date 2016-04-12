module Api
  module V1
    class FindController < ApiController
      respond_to :json

      def show
        attr_mapper(params)
        respond_with @model.find_by("#{@attr_type}" => "#{@attr_val}")
      end

      def index
        attr_mapper(params)
        respond_with @model.where("#{@attr_type}" => "#{@attr_val}")
      end
    end
  end
end
