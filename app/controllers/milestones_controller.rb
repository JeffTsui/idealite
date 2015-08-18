class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]
  before_action :init, only: [:create, :update]

  respond_to :html, :js

  def index
    @milestones = Milestone.all
    respond_with(@milestones)
  end

  def show
    respond_with(@milestone)
  end

  def new
    @milestone = Milestone.new
    respond_with(@milestone)
  end

  def edit
  end
  
  #create or update
  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.save
  end

  def update
    @milestone.update(milestone_params)
    @update = true
    render template: "/milestones/create.js.erb"
  end

  def destroy
    @idea = Idea.find(params[:idea_id])
    @milestone.destroy
    render template: "/milestones/create.js.erb"
  end

  private
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    def milestone_params
      params.require(:milestone).permit(:idea_id, :start_date, :end_date, :progress, 
        :title, :detail, :critical_flag)
    end
    
    def init
      @idea = Idea.find(params[:milestone][:idea_id])
      @modal_id = params[:milestone][:modal_id]
    end
end
