class PostsController < ApplicationController

  before_action :user_has_profile?
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :user_belongs, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  private
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def user_belongs
      if @post.user != current_user
          redirect_to posts_path, notice: "This post doesn't belong to you."
      end
    end
end
