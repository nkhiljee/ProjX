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
<<<<<<< HEAD
        # @team = Team.find_by_slug(params[:slug])   
        # @user = User.find_by_slug(params[:slug])

        # @user = User.find(session[:user_id])
        @team = Team.find(params[:id])
        # byebug
        @post = Post.find(params[:id])
=======
        @team = Team.find_by_slug(params[:slug])   
        @user = User.find(session[:user_id])
        @userteam = @team.user_teams
        # byebug

        # @team = Team.find(params[:id])
        # @post = Post.find(params[:id])
>>>>>>> master
        # @user = User.find(params[:id])
    end

    # def require_login
    #     return head(:forbidden) unless session.include? :user_id
    # end

end
