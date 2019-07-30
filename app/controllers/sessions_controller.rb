class SessionsController < ApplicationController

    def new
        # nothing to do here!
        @user = User.new
    end
 
    def create
        session[:user_id] = params[:user_id]
        redirect_to '/'
        
    end

    def destroy
        session.delete :user_id
    end


end
