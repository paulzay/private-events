class EventAttendancesController < ApplicationController
    
        # before_action  only: [:show, :edit, :update, :destroy]
        # before_filter :require_login
      
      
      
      def new
        if Eventattendance.exists?(events_id: params[:event_id].to_i, user_id: current_user.id)
          redirect_to event_path(params[:event_id])
        else
          @eventattendance = Eventattendance.new(events_id: params[:event_id].to_i, user_id: current_user.id)
          @eventattendance.save
          redirect_to event_path(params[:event_id])
        end
      end
      
    

    def destroy
        if Eventattendance.exists?(events_id: params[:event_id].to_i, user_id: current_user.id)
          Eventattendance.where(events_id: params[:event_id].to_i, user_id: current_user.id).first.destroy
          redirect_to event_path(params[:event_id])
        else
          redirect_to event_path(params[:event_id])
        end
      end
      
      def show
        @eventattendances = Eventattendance.find_by(events_id: params[:id])
      end
      
      
       private
       def author_params
         params.require(:author).permit(:username, :email, :password,:password_confirmation)
       end
      
       def event_params
         params.require(:event).permit(:title, :body)
       end
         end