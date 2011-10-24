class AdminsController < ApplicationController

  before_filter :authenticate_user! 

  def manage_permission
    if current_user.master?
      @users = User.all
    else
      @users = []
    end
  end

end
