class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end
  
  
  def update
    if @user.update(user_params)
      flash[:notice] = "Usuario actualizado exitosamente."
      redirect_to roles_path
    else
      flash[:alert] = "Hubo un error, intente nuevamente."
      render 'edit'
    end
  end

  private 

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :role_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
