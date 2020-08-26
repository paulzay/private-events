class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
