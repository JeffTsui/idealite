class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @idea = Idea.find(params[:post][:idea_id])
    @post = Post.new(post_params)
    @post.save
    @post_actor = PostActor.create(post_id: @post.id, post_actor_type: params[:post_actor_cat], 
      post_actor_id: params[:post_actor_id])
    redirect_to @idea
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:idea_id, :user_id, :text)
    end
end
