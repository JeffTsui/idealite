class ThemesController < ApplicationController
  before_action :set_theme, only: [:show, :edit, :update, :destroy, :apply_idea]

  respond_to :html

  def index
    @themes = Theme.all
    respond_with(@themes)
  end

  def show
    @my_ideas = Idea.my_ideas_all(current_user.id)
    respond_with(@theme)
  end
  
  def claim_theme
    @theme_title = params[:text]
    @similar_themes = Theme.all
    render layout: "similar_ideas"
  end
  
  #Apply idea to theme
  def apply_idea
    @idea = Idea.find(params[:idea_id])
    @theme.apply_idea(@idea.id, current_user.id, params[:value])
    respond_to do |format|
      format.js
    end
  end

  def new
    @theme = Theme.create(title: params[:title])
    redirect_to edit_theme_path(@theme)
  end

  def edit
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.save
    respond_with(@theme)
  end

  def update
    @theme.update(theme_params)
    respond_with(@theme)
  end

  def destroy
    @theme.destroy
    respond_with(@theme)
  end

  private
    def set_theme
      @theme = Theme.find(params[:id])
    end

    def theme_params
      params.require(:theme).permit(:title, :reward, :policy, :type, 
        :privacy_flag, :start_time, :end_time, :user_id, :team_id, :detail)
    end
end
