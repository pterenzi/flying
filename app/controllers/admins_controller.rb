class AdminsController < ApplicationController

  before_filter :authenticate_user! 

  def manage_permission
    if current_user.master?
      @users = User.all
    else
      @users = []
    end
  end

  def change_level
    u = User.find(params[:user_id])
    u.level = params[:level].to_i
    u.save
    redirect_to admins_manage_permission_path
  end

end
