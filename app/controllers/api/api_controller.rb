module Api
  class ApiController < ApplicationController
    def attr_mapper
      @model      = params[:model].singularize.classify.constantize
      @attr_type  = params.first[0]
      @attr_val   = set_attr_val(params)
    end

    def association_path_finder
      @model = params["model"].singularize.classify.constantize
      @id = params["id"].to_i
      @association = params["association"]
    end

    private
      def set_attr_val(params)
        if ["id", "quantity", "item_id", "invoice_id", "customer_id", "merchant_id"].include?(@attr_type)
          params.first[1].to_i
        elsif @attr_type == "unit_price"
          convert_to_cents(params.first[1])
        else
          params.first[1]
        end
      end

      def convert_to_cents(unit_price_param)
        BigDecimal.new(unit_price_param) * 100
      end
  end
end
