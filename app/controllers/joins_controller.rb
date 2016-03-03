class JoinsController < ApplicationController

    def index
        
    end

    def new

    end

    def create
        event = Event.find(params[:event_id])
        event.joins.create(user_id: params[:user_id],event_id: params[:event_id])
        
        redirect_to "/users/#{current_user.id}"
    end

    def show
        
    end

    def edit
        
    end

    def update
        
    end

    def destroy
        join = Join.find_by(user_id: params[:user_id], event_id: params[:event_id])
        if (join)
            join.destroy
            
                redirect_to "/users/#{current_user.id}"
        else 
            
                redirect_to "/users/#{current_user.id}"
        end
       
    end

end