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
    def create
        @event = current_user.events.build(event_params)
       
        if @event.save
            redirect_to @event
        else
            render 'new'
        end
    end
    def edit
        @event = Event.find(params[:id])
        @event.update!
        redirect_to @event
    end

    def delete
        @event= Event.find(params[:id])
        @event.destroy
        redirect_to root_path
    end

    private

    def event_params
        params.require(:event).permit(:event_date, :description)
    end
end
