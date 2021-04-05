class RegistrationsController < ApplicationController
  def new
    @user = User.new #will look at database tables and attributes what we have in our user model and create a new on in memory
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Succefully created account"
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end