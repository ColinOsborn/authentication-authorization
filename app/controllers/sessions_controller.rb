class SessionsController < ApplicationController
  def new
  end

  def create
    # creating a session
    # find a user, check to see if they authenticate via their password
    user = User.find_by(username: params[:session][:username])
    # if successfull, send them to the users page
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to user_path(user)
    else
      flash.now[:error] = "Invalid Login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
