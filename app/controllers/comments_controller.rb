class CommentsController < ApplicationController

    def index
        
    end

    def new

    end

    def create
        comment = Comment.new(comment: params[:comment], 
                            user_id: current_user.id,
                            event_id: params[:event_id])
    
        if comment.save
            redirect_to :back
        end
    end

    def show
        
    end

    def edit
        
    end

    def update
        
    end

    def destroy
       
    end

end