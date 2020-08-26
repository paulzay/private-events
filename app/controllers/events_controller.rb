class EventsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy edit]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      @event.attendees << current_user
      redirect_to root_path
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def show
    @event = Event.find(params[:id])
    @invitation = Invitation.new
  end

  def update
    @event = Event.find(params[:id])
    @event.update!(event_params)
    redirect_to @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :name, :location, :description)
  end
end
