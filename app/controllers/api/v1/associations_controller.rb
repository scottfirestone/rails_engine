module Api
  module V1
    class AssociationsController < ApiController
      respond_to :json

      def show
        association_path_finder
        respond_with @model.find(@id).send(@association), root: false
      end
    end
  end
end
