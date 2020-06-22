class RolesController < ApplicationController
  #before_action :set_user, only: [:index]

  def index
    @users = User.all
  end

  private 
  def set_user
    @user = User.find(current_user.id)
  end
end
