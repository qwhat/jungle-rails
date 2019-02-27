class SessionsController < ApplicationController
  def new
    #redirects to home page when trying to access /login while logged in already
    if current_user
      redirect_to '/'
    end
  end

  def create
    #compares email to database and compares hashed password, if match, signs you in
    if user = User.authenticate_with_credentials("#{params[:email]}".strip.downcase, params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      #if either check fails
      redirect_to '/login'
    end
  end

  def destroy
    #logs you out
    session[:user_id] = nil
    redirect_to '/login'
  end
end
