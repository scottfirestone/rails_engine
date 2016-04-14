module Api
  module V1
    module Items
      class BestDayController < ApiController
        respond_to :json

        def show
          response = Item.find(params["id"]).best_day
          respond_with response, root: false
        end
      end
    end
  end
end
