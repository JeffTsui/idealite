class IdeaLinksController < ApplicationController
  before_action :set_idea_link, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @idea_links = IdeaLink.all
    respond_with(@idea_links)
  end

  def show
    respond_with(@idea_link)
  end

  def new
    @idea_link = IdeaLink.new
    respond_with(@idea_link)
  end

  def edit
  end

  def create
    @idea_link = IdeaLink.new(idea_link_params)
    @idea_link.save
    respond_with(@idea_link)
  end

  def update
    @idea_link.update(idea_link_params)
    respond_with(@idea_link)
  end

  def destroy
    @idea_link.destroy
    respond_with(@idea_link)
  end

  private
    def set_idea_link
      @idea_link = IdeaLink.find(params[:id])
    end

    def idea_link_params
      params.require(:idea_link).permit(:idea_source_id, :idea_target_id, :user_id)
    end
end
