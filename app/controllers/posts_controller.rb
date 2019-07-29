class PostsController < ApplicationController
    
    def new
        @post = Post.new
        @ut = UserTeam.all
        @ut_names = @ut.map do |ut|
            ut.team.name
        end.uniq!
        # byebug
    end 

    def create
        @post = Post.create(posts_params)
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

    # def ut_names  
    #     @ut_names = @ut.map do |ut|
    #         ut.team.name
    #     end
    #     @name= @ut_names.uniq!.each do |n|
    #         n
    #     end
    #     @name
    # end


end
