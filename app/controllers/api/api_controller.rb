module Api
  class ApiController < ApplicationController
    def attr_mapper
      @model      = params[:model].singularize.classify.constantize
      @attr_type  = params.first[0]
      @attr_val   = set_attr_val(params)
    end

    private
      def set_attr_val(params)
        if ["id", "quantity", "unit_price", "item_id", "invoice_id", "customer_id", "merchant_id"].include?(@attr_type)
          params.first[1].to_i
        else
          params.first[1]
        end
      end
  end
end
