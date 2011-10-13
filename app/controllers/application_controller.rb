class ApplicationController < ActionController::Base
  protect_from_forgery

  def date_params
    if params[:start_date]
      @start_date = params[:start_date].to_date
      @end_date   = params[:end_date].to_date
    else
      @start_date = Date.today
      @end_date   = Date.today
    end
  end
end
