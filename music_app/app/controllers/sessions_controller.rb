class SessionsController < ApplicationController
  # LOGIN
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login(@user)
      redirect_to user_url(@user) #no need for the .id on @user
    else
      flash.now[:errors] = ["Invalid email password combo"]
      @user = User.new(email: params[:user][:email])
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_sessions_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end