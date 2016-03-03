class UsersController < ApplicationController

    def index
        
    end

    def new

    end

    def create
        user = User.new(first_name: params[:first_name],
                    last_name: params[:last_name],
                    email: params[:email],
                    location: params[:location],
                    state: params[:state],
                    password: params[:password])
        if user.save
            session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        else 
            flash[:errors] = @errors = user.errors.full_messages
            redirect_to "/users/new"
        end
    end

    def show
        @users = User.all
        @user = User.find(params[:id])

        state = current_user.state
        @events = Event.order(date: :asc).all.where(state: state)
        @eve = Event.order(date: :asc).first(2)
        @other = Event.order(date: :asc).all.where.not(state: state)
    end

    def edit
        @user = User.find(params[:id])
        
    end

    def update
        user = User.find(params[:id])
        user.first_name = params[:first_name]
        user.last_name = params[:last_name]
        user.email = params[:email]
        user.location = params[:location]
        user.state = params[:state]

        user.save

        session[:user_id] = user.id
            redirect_to "/users/#{user.id}"
        
    end

    def destroy
        
       
    end

    private

    def user_params
        params.require(:User).permit(:first_name, :last_name, :email, 
            :location, :state, :password, :password_confirmation)
    end

end