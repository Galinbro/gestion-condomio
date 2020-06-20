class WelcomeController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    flash[:notice] = "Bienvenido #{@user.email}."
  end

  private 
  def set_user
    @user = User.find(current_user.id)
  end
end
