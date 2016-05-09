class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash.now[:error] = "Incorrect email or password. Please try again."
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "Successfully logged out. Goodbye!"
    redirect_to login_path
  end
end
