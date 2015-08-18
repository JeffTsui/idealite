class HomeController < ApplicationController
  def index
    @idea = Idea.new
    @my_ideas_top = Idea.my_ideas_top_all(current_user.id)
    @my_themes_top = Theme.my_themes_top_all(current_user.id)
    @top_grossing_ideas = Idea.top10_followed
    @top_grossing_themes = Theme.top10_followed
  end
  
end
