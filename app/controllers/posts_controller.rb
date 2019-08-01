class PostsController < ApplicationController
    
    def new
        user = User.find(session[:user_id])
        @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
        @post = Post.new
    end 

    def create
        @ut = UserTeam.find(posts_params[:user_team_id])
        @team = Team.find(@ut.team_id)
        post = Post.create(posts_params)
        redirect_to "/teams/#{@team.slug}"

    end

    def edit
        # byebug
        @post = Post.find(params[:id])
        user = User.find(session[:user_id])
        @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
        
    end

    def update
        # byebug 
        @post = Post.find(params[:id])
        @post.update(posts_params)
        @team = @post.user_team.team
        redirect_to "/teams/#{@team.slug}"
    end

    def destroy
        # byebug
        @post = Post.find(params[:id])
        @post.destroy
        @team = @post.user_team.team
        redirect_to "/teams/#{@team.slug}"
    end


    private
    def posts_params
        params.require(:post).permit(:title, :description, :file, :user_team_id)
    end


end
