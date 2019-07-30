class SessionsController < ApplicationController

    def new
        # nothing to do here!
        @user = User.new
    end
 
    def create
        session[:username] = params[:username]
        redirect_to '/'
    end

    def destroy
        session.delete :username
    end


end