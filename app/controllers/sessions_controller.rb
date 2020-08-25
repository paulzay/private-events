class SessionsController < ApplicationController
  def new; end

  def create
    if @user = User.find_by(params[:session][:email])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = 'Please try again'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to signup_path
  end
end
