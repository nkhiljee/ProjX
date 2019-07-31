class UsersController < ApplicationController

    # before_action :require_login
    # skip_before_action :require_login, only: [:index, :new]
    skip_before_action :authenticated, only: [:new, :create]



    def index
        @users = User.all
        @user = User.new
    end

    def new
        @user = User.new
    end

    def create
        # session[:username] = params[:user][:username]
        @user = User.new(user_params)
        # @user.name = params[:user][:name]
        # @user.username = params[:user][:username]
        # @user.email = params[:user][:email]
        # byebug
        if @user.valid?
            @user.save
            redirect_to user_path(@user.slug)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        # @user = User.find_by_slug(params[:slug])
        @user = User.find_by(username: params[:id])
        # byebug
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
    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    # def require_login
    #     return head(:forbidden) unless session.include? :username
    # end
end
