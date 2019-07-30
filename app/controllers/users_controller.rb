class UsersController < ApplicationController

    # before_action :require_login
    # skip_before_action :require_login, only: [:index, :new]


    def index
        @users = User.all
        @user = User.new
    end

    def new
        @user = User.new
    end

    def create
        # session[:username] = params[:user][:username]
        @user = User.new
        @user.name = params[:user][:name]
        @user.username = params[:user][:username]
        @user.email = params[:user][:email]
        @user.save
        redirect_to user_path(@user.slug)
    end

    def show
        @user = User.find_by_slug(params[:slug])
        # @user = User.find(session[:user_id])
        # @user = User.find(params[:id])
        @userteams = @user.teams
        @projects = []
        @userteams.each  do |team|
            team.projects.each do |project|
                @projects << project.name
            end
        end
    end

    def require_login
        return head(:forbidden) unless session.include? :username
    end
end
