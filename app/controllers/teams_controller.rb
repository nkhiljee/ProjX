class TeamsController < ApplicationController

    # before_action :require_login
    # skip_before_action :require_login, only: [:index, :new]
    

    
    def create
        redirect_to user_path(@team)
        # redirect_to user_path(@team.slug)
    end
    
    
    def show
        @team = Team.find_by_slug(params[:slug])   
        @user = User.find(session[:user_id])
        @userteam = @team.user_teams
        # @dueProject = nil => MAY OR MAY NOT NEED THIS LINE SO FAR NO BUGS HERE- connected to team.rb method: next_project_due
        @projects = @team.projects
        
    end

    

end
