class EventsController < ApplicationController
    def index
        @events = Event.all 
    end
    def new
        @event = Event.new
    end
    def show
        @event = Event.find(params[:id])
    end
    def create
        @event = Event.build(events_params)
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

    def events_params
        params.permit(:event).require(:event_date, :description)
    end
end
