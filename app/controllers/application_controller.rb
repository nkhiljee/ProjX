class ApplicationController < ActionController::Base
    # skip_before_action :authenticated, only: [:home]
    before_action :authenticated, except: [:home]


    def home
        render  '/applications/home.html'
    end

    def current_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        else
            #nil
        end
        # @user = User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authenticated 
        redirect_to login_path unless logged_in?
    end

end
