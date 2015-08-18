class ThemeIdeasController < ApplicationController
  before_action :set_theme_idea, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @theme_ideas = ThemeIdea.all
    respond_with(@theme_ideas)
  end

  def show
    respond_with(@theme_idea)
  end

  def new
    @theme_idea = ThemeIdea.new
    respond_with(@theme_idea)
  end

  def edit
  end

  def create
    @theme_idea = ThemeIdea.new(theme_idea_params)
    @theme_idea.save
    respond_with(@theme_idea)
  end

  def update
    @theme_idea.update(theme_idea_params)
    respond_with(@theme_idea)
  end

  def destroy
    @theme_idea.destroy
    respond_with(@theme_idea)
  end

  private
    def set_theme_idea
      @theme_idea = ThemeIdea.find(params[:id])
    end

    def theme_idea_params
      params.require(:theme_idea).permit(:theme_id, :idea_id, :score)
    end
end
