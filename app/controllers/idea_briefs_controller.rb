class IdeaBriefsController < ApplicationController
  before_action :set_idea_brief, only: [:show, :edit, :update, :destroy]
  before_action :my_idea_briefs

  respond_to :html
  
  def index
    respond_with(@idea_briefs)
  end

  def show
    respond_with(@idea_brief)
  end

  def new
    @idea_brief = IdeaBrief.new
    respond_with(@idea_brief)
  end

  def edit
    render :text=>"OK"
  end

  def create
    @idea_brief = IdeaBrief.new(idea_brief_params)
    @idea_brief.user_id = current_user.id
    @idea_brief.save
    respond_with(@idea_brief)
  end

  #Update
  def update
    @idea_briefs = IdeaBrief.all
    @idea_brief.update(idea_brief_params)
    @idea_brief.tag_list = idea_brief_params[:idea_tags]
    @idea_brief.audience_list = idea_brief_params[:target]
    @idea_brief.save!
    #logger.debug "#{params[:audience]}".light_yellow
    logger.debug "audience tag_list = #{@idea_brief.audience_list}".light_yellow
    logger.debug @uploder.inspect.light_yellow
    redirect_to detail_idea_path(@idea_brief.idea)
  end

  def destroy
    logger.debug "destroy".light_yellow
    @idea_brief.destroy
    respond_with(@idea_brief)
  end

  private
    def my_idea_briefs
      @idea_briefs = IdeaBrief.where(user_id: current_user.id)
    end
    
    def set_idea_brief
      @idea_brief = IdeaBrief.find(params[:id])
    end

    def idea_brief_params
      params.require(:idea_brief).permit(:title, :problem, :target, :how, :result, 
      :risk, :user_id, :short_desc, :idea_tags, :tag_list, :audience_list)
    end
end
