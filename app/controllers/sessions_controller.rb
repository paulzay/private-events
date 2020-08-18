class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(emal: params[:session][:emal])
    if user&.authenticate(params[:session][:emal])
      log_in user
      redirect_back_or user
    else
      # flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to signup_path
  end
end
