class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = policy_scope(Post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post, notice: "your post was created successfully"
    else
      render :new
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "your post was created successfully"
    else
      render :edit
    end
  end

  def show
    # @post = policy_scope(Post).find(post_params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:date, :rationale)
    end
    def set_post
      @post = Post.find(params[:id])
    end

end
