module Api
  module V1
    class FindController < ApiController
      respond_to :json

      def show
        attr_mapper(params)
        # binding.pry
        respond_with @model.find_by("#{@attr_type}" => "#{@attr_val}")
      end
    end
  end
end
