class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def attr_mapper(params)
    @model      = params[:model].singularize.classify.constantize
    @attr_type  = params.first[0]
    @attr_val   = set_attr_val(params)
  end

  private
    def set_attr_val(params)
      if @attr_type == "id"
        params.first[1].to_i
      else
        params.first[0]
      end
    end
end
