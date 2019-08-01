class UsersController < ApplicationController

    skip_before_action :authenticated, only: [:new, :create]



    def index
        @users = User.all
        @user = User.new
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to users_path(@user.slug)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def show
        @team = Team.find_by_slug(params[:slug])
        @user = User.find_by(username: params[:id])
        @userteams = @user.teams
        @projects = []
        @userteams.each  do |team|
            team.projects.each do |project|
                @projects << project
            end
        end
        
 
    end
    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
    
    

end
