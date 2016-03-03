class SessionsController < ApplicationController

    def index
        
    end

    def new

    end

    def create
        user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to "/users/#{user.id}"
            else 
                flash[:errors] = ["Invalid Credentials"]
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
            
        session.delete(:user_id)
        redirect_to '/sessions/new'
       
    end

end