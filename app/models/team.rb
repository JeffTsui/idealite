class Team < ActiveRecord::Base
    has_many :user_teams
    has_many :users, :through => :user_teams
    has_one :profile, :as => :profile
    has_many :post_actor, :as => :post_actor
    has_many :idea_teams
    has_many :ideas, :through => :idea_teams
    has_many :roles, class_name: "UserTeamRole"
    has_many :open_roles, ->{where "user_team_roles.open_flag = ?", true}, class_name: "UserTeamRole"
    
    def self.teams_admined(user_id)
      Team.joins(:user_teams).where(:user_teams => {user_id: user_id, role_id: 0})
    end
    
    def self.teams_membered(user_id)
      Team.joins(:user_teams).where(:user_teams => {user_id: user_id, role_id: 1})
    end
    
    #idea that this team is the default team
    def default_idea
      idea_team = IdeaTeam.find_by(team_id: id, role_id: 0)
      idea_team.idea if idea_team
    end
end