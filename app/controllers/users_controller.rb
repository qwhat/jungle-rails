class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    #handles the signup of new users
    unique = true
    if User.find_by(params[:email])
      unique = false
    end
    @user = User.new(user_params)

    if !unique
      redirect_to '/signup'
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
