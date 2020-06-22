class RolesController < ApplicationController
  before_action :set_user, only: [:edit]

  private 
  def set_user
    @user = User.find(current_user.id)
  end
end
