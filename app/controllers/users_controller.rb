class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)
    if @user.save
      flash[:notice] = "Usuario creado exitosamente"
      redirect_to users_path
    else
      flash[:alert] = "Hubo un error, intente nuevamente."
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "Usuario actualizado exitosamente."
      redirect_to users_path
    else
      flash[:alert] = "Hubo un error, intente nuevamente."
      redirect_to users_path
    end
  end

  def destroy
    @user.role_id = 4
    if @user.save
      flash[:notice] = "Cuenta borrada exitosamente."
      redirect_to users_path
    else
      flash[:alert] = "Hubo un error, intente nuevamente."
      render 'edit'
    end
  end
  

  private 
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :role_id)
  end
  
  def user_params_create
    params.require(:user).permit(:firstname, :lastname, :email, :role_id, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
