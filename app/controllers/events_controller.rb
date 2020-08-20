class EventsController < ApplicationController
  
    def index
        @events = Event.all 
    end
    def new
        @event = current_user.events.build
    end
    def show
        @event = Event.find(params[:id])
    end
    def edit
        @event = Event.find(params[:id])
    end

    def create
        @event = current_user.events.build(event_params)
       
        if @event.save
            redirect_to event_path(@event)
        else
            render 'new'
        end
    end
    def update
        @event = Event.find(params[:id])
        @event.update!(event_params)
        redirect_to @event
    end

    def destroy
        @event= Event.find(params[:id])
        @event.destroy!
        redirect_to :new
    end

    private

    def event_params
        params.require(:event).permit(:date, :name, :location, :description)
    end
end
