class ApplicationController < ActionController::Base
  protect_from_forgery
  
        before_filter :authenticate_user! 

  def date_params
    if params[:start_date]
      @start_date = params[:start_date].to_date.to_s_br
      @end_date   = params[:end_date].to_date.to_s_br
    else
      @start_date = Date.today.to_s_br
      @end_date   = Date.today.to_s_br
    end
  end
end
