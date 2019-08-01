class PostsController < ApplicationController
    
    def new
        user = User.find(session[:user_id])
        @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
        @post = Post.new
    end 

    def create
        @post = Post.new(posts_params)
        @ut = UserTeam.find(posts_params[:user_team_id])
        @team = Team.find(@ut.team_id)
        if @post.valid?
            @post.save
            redirect_to "/teams/#{@team.slug}"
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def edit
        @post = Post.find(params[:id])
        user = User.find(session[:user_id])
        @uts = UserTeam.all.select {|ut| ut.user_id == user.id}
        
    end

    def update
        @post = Post.find(params[:id])
        @team = @post.user_team.team
        @post.assign_attributes(posts_params)
        if @post.valid?
            @post.update(posts_params)
            redirect_to "/teams/#{@team.slug}"
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
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
