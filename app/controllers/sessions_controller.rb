class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign In
      sign_in user
      redirect_back_or user
    else
      # Redirect w/ errors
      flash.now[:error] = "Invalid email or password.  Please try again."
      render 'new'
    end
  end

  def new
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
