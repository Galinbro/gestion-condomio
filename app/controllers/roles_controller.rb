class RolesController < ApplicationController
  before_action :set_user, only: [:edit]

  def index
    @users = User.all
  end

  def edit
    
  end
  
  def update
    
  end

  private 
  def set_user
    @user = User.find(current_user.id)
  end
end
