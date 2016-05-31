class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to links_path
      flash[:notice] = "Account Created!"
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
      #I changed this from a flash.now and a render :new because, for some
      #reason, when this errors it renders wonky CSS. With this approach the
      #CSS stays in place, however the form now clears itself completely upon error
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
