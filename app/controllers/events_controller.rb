class EventsController < ApplicationController

    def index
        
    end

    def new

    end

    def create
        event = Event.new(name: params[:name],
                    date: params[:date],
                    location: params[:location],
                    state: params[:state],
                    user_id: current_user.id)
        if event.save
            redirect_to :back
        else 
            flash[:errors] = @errors = user.errors.full_messages
            redirect_to :back
        end
    end

    def show
        @event = Event.find(params[:id])
        x = Join.all.where(event_id: params[:id])
        u = x.pluck(:user_id)
        @users = User.all.where(id:u)

        @comment = Comment.where(event_id: params[:id])

    end

    def edit
        
    end

    def update
        
    end

    def destroy
            
        event = Event.find(params[:id])
        event.destroy
        redirect_to :back
       
    end

end