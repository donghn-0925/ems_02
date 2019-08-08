class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "success"
      redirect_to edit_user_path(current_user)
    else
      flash[:danger] = t "failed"
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = t "updated"
      render :edit
    else
      render :edit
    end
  end

  private
  def user_params
    defaults = {status: true, role: "trainee", create_by: current_user.id}
    params.require(:user).permit(:fullname, :password, :password_confirmation, :email, :address, :phone, :status).reverse_merge(defaults)
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = t "please_login"
      redirect_to login_url
    end
  end
end
