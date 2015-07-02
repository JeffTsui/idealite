class PostActorsController < ApplicationController
  before_action :set_post_actor, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @post_actors = PostActor.all
    respond_with(@post_actors)
  end

  def show
    respond_with(@post_actor)
  end

  def new
    @post_actor = PostActor.new
    respond_with(@post_actor)
  end

  def edit
  end

  def create
    @post_actor = PostActor.new(post_actor_params)
    @post_actor.save
    respond_with(@post_actor)
  end

  def update
    @post_actor.update(post_actor_params)
    respond_with(@post_actor)
  end

  def destroy
    @post_actor.destroy
    respond_with(@post_actor)
  end

  private
    def set_post_actor
      @post_actor = PostActor.find(params[:id])
    end

    def post_actor_params
      params.require(:post_actor).permit(:post_id, :post_actor_type, :post_actor_id)
    end
end
