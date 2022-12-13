class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to new_register_path
    end
    # user = User.create(user_params)
    # flash[:success] = "Welcome, #{user.users}!"
    # redirect_to user_path(user)
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
