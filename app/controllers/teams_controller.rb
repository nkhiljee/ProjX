class TeamsController < ApplicationController

    # before_action :require_login
    # skip_before_action :require_login, only: [:index, :new]
    
    def user_posts
        UserTeam.each do |ut|
            ut
        end

    end
    
    def create
        redirect_to user_path(@team)
        # redirect_to user_path(@team.slug)
    end
    
    
    def show
        @team = Team.find_by_slug(params[:slug])   
        @user = User.find(session[:user_id])
        @userteam = @team.user_teams
        @dueProject = nil
    end

    

end
