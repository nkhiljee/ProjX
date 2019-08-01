class SessionsController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]

    def new
    end

    def create
        # byebug
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            session[:user_slug] = @user.slug
            redirect_to "/users/#{session[:user_slug]}"
        else
            redirect_to login_path
        end
    end

    def logout
        session.delete(:user_id)
        session.delete(:user_slug)
        redirect_to '/'
    end


end
