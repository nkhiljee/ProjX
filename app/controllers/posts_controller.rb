class PostsController < ApplicationController
    
    def new
        if session[:user_id]
            user = User.find(session[:user_id])
            # user = User.first

            @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
            @post = Post.new
        else
            redirect_to '/login'
        end
        # byebug
    end 

    def create
        post = Post.create(posts_params)
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
