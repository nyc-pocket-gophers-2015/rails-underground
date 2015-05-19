class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:warn] = 'Login incorrect'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end