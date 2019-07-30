class TeamsController < ApplicationController

    
    def create
    
        redirect_to user_path(@team.slug)
    end
    
    
    def show
        @team = Team.find_by_slug(params[:slug])        
        # @team = Team.find(params[:id])
        @post = Post.find(params[:id])
        @user = User.find(params[:id])
    end

end
