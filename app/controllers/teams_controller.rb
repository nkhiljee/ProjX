class TeamsController < ApplicationController

    def show
        @team = Team.find(params[:id])
        @post = Post.find(params[:id])
        @user = User.find(params[:id])
    end

end
