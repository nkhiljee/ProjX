class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.name = params[:user][:name]
        @user.username = params[:user][:username]
        @user.email = params[:user][:email]
        @user.save
        redirect_to user_path(@user.slug)
    end

    def show
        @user = User.find_by_slug(params[:slug])
        # @user = User.find(params[:id])
        @userteams = UserTeam.all
        @projects = Project.all
    end
end
