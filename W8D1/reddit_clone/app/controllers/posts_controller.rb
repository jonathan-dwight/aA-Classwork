class PostsController < ApplicationController

    def new
        @post = Post.new
        @subs = Sub.all
        render :new
    end

    def create
        @post = Post.new(post_params)
       
        if @post.save
            redirect_to post_url(@post)
        else
            flash[:error] = @post.errors.full_messages
            redirect_to post_url(@post)
        end
    end

    def show
        @post = Post.find_by(id: params[:id])
        check = @post.author_id
        @user = User.find_by(id: check)
        render :show
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])

        if @post && @post.update(post_params)
            redirect_to sub_url(@post.sub_id)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :edit
        end
        
    end

    def destroy
        @post = current_user.posts.find_by(id: params[:id])
        if @post && @post.destroy
            redirect_to sub_url(@post.sub_id)
        else
            flash[:errors] = ["You are not the current user!"]
            redirect_to subs_url
        end
    end

    private
    #sub/posts joins table with col of sub_id & post_id
    def post_params
        params.require(:post).permit(:title, :url, :content, :author_id, sub_ids: [])
    end
end
