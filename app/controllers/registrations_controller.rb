class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'You are signed in!'
    else
      render :new
    end
  end


end
