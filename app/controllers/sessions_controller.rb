class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      # log the user in and direct to show page
      flash[:success] = "Welcome back, #{user.username}"
      log_in(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password' # Log in not
      render 'new' # Try once more
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path
  end
end
