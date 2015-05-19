class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      flash[:warn] = 'Could not save user'
      render :new
    end
  end

  def find_by_email
    user = User.find_by(email: params[:email])
    if user
      render json: user
    else
      render text: "Not found", status: 404
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :age, :password)
  end
end