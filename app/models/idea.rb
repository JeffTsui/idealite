class Idea < ActiveRecord::Base
    attr_default :privacy_flag, 0 #set default privacy to only me
    
    belongs_to :user
    belongs_to :idea_brief
    has_many :idea_teams
    has_many :teams, through: :idea_teams
#    has_one :default_idea_team, ->{where "idea_teams.role_id = 0"}, class_name: "IdeaTeam"
#    has_one :default_team, through: :default_idea_team, class_name: "Team"
    has_many :post_actors, :as => :post_actor
    has_many :posts, ->{order "created_at DESC"}
    has_many :idea_links, ->{where "idea_links.link_type <> 0"}
    has_many :idea_linked, class_name: "IdeaLink", foreign_key: "idea_linked_id"
    has_many :milestones, ->{order "created_at DESC"}
    has_many :idea_surveys
    has_many :surveys, through: :idea_surveys
    
    #Socialization
    acts_as_followable
    acts_as_likeable
    acts_as_mentionable
    has_many :follows, :as => :followable
    scope :top10_followed, -> {joins(:follows).group("ideas.id").order("count(follows.id) desc").limit(10)}
    
    def self.claim_idea(user_id, title)
        idea = self.new
        idea.user_id = user_id
        idea_brief = IdeaBrief.new
        idea_brief.title = title
        idea.idea_brief = idea_brief
        idea.save
        idea_brief.save
        #Skip callback to set avatar to nil, override default filename in AvatarUploader
        idea_brief.update_column(:avatar, nil)
        return idea
    end
    
    def self.watched_ideas(user)
        user.followees(Idea)
    end
    
    def active_survey
        survey = self.surveys.where(finished: false).order("survey_surveys.created_at DESC").first
        logger.debug survey.inspect.light_yellow
        return survey
    end
    
    def link_value(idea_id, user_id)
        idea_link = IdeaLink.where("idea_id = ? and idea_linked_id = ? and user_id = ?", self.id, idea_id, user_id)
        value = idea_link.empty?? 0 : idea_link[0].link_type
        logger.debug "idea link value = #{value}".light_yellow
        return value
    end
    
    def is_my_idea?(user_id)
        idea_team_ids = self.teams.map{|i| i.id}
        user_team_ids = User.find(user_id).teams.map{|i| i.id}
        logger.debug "overlapped teams: #{(user_team_ids & idea_team_ids)}".light_yellow
        logger.debug "onwer user id: #{user.id.to_s.light_yellow}".light_yellow
        #in idea teams or creator of the idea
        !(user_team_ids & idea_team_ids).empty? || self.user.id == user_id
    end
    
    def is_team_idea?(team_id)
        idea_team_ids = self.teams.map{|i| i.id}
        idea_team_ids.include? team_id
    end
    
    #Teams belong to idea and user both
    def my_idea_teams(user_id)
        self.teams & User.find(user_id).teams
    end
    
    def self.my_ideas_all(user_id)
        team_ideas = Idea.joins(teams: :users).where(users: {id: user_id}).distinct
        my_ideas = Idea.where(user_id: user_id)
        my_ideas_all = team_ideas | my_ideas
        return my_ideas_all
    end
    
    #Default team is role = 0
    def default_team
        default_idea_team = self.idea_teams.where("idea_teams.role_id = 0").first
        default_idea_team.team
    end
    
    def default_team_members
        default_team.users if default_team
    end
    
    def default_team_opens
        default_team.roles if default_team
    end

    def user_role(user_id)
        UserTeam.where(team_id: default_team.id).where(user_id: user_id).first.role_id
    end
    
    def user_role_desc(user_id)
        UserTeamRole.role_desc(user_role(user_id))
    end
    
    #All ideas belongs to user teams, ordered by watchers
    def self.my_ideas_top_all(user_id)
        sort_by_watchers(my_ideas_all(user_id))
    end
    
    #All ideas NOT belong to user teams, ordered by watchers
    def self.top_grossing_ideas(user_id)
        ideas = Idea.joins(teams: :users).where.not(users: {id: user_id}).distinct
        return ideas
    end
    
    def closed_surveys
        self.surveys.where(finished: true).order("created_at DESC")
    end
    
    private
    
    def self.sort_by_watchers(ideas)
        ideas.sort { |a,b| b.likers(User).count <=> a.likers(User).count }
    end
end

