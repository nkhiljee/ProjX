class PostsController < ApplicationController
    
    def new
<<<<<<< HEAD
        if session[:user_id]
            user = User.find(session[:user_id])
            # user = User.first

            @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
            @post = Post.new
        else
            redirect_to '/login'
        end
=======
        user = User.find(session[:user_id])
        # user = User.first

        @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
        @post = Post.new
>>>>>>> master
        # byebug
    end 

    def create
        @ut = UserTeam.find(posts_params[:user_team_id])
        @team = Team.find(@ut.team_id)
        post = Post.create(posts_params)
        redirect_to "/teams/#{@team.slug}"

        # byebug
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.update
        redirect_to @post
    end

    def destroy
        @post = Post.destroy
        redirect_to posts_path
    end

    private
    def posts_params
        params.require(:post).permit(:title, :description, :file, :user_team_id)
    end


end
