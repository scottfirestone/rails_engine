module Api
  module V1
    class FindController < ApiController
      before_action :attr_mapper, only: [:show, :index]
      respond_to :json

      def show
        respond_with @model.find_by("#{@attr_type}" => "#{@attr_val}"), root: false
      end

      def index
        respond_with @model.where("#{@attr_type}" => "#{@attr_val}"), root: false
      end
    end
  end
end
