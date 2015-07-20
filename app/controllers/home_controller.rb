class HomeController < ApplicationController
  def index
    @idea = Idea.new
    @my_ideas_top = Idea.my_ideas_top_all(current_user.id)
    @top_grossing_ideas = Idea.top10_followed
  end
  
end
