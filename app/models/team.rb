class Team < ActiveRecord::Base
    has_many :user_teams
    has_many :users, :through => :user_teams
    has_one :profile, :as => :profile
    has_many :post_actor, :as => :post_actor
    has_many :idea_teams
    has_many :teams, :through => :idea_teams
    
    def self.teams_admined(user_id)
      Team.joins(:user_teams).where(:user_teams => {user_id: user_id, role_id: 0})
    end
    
    def self.teams_membered(user_id)
      Team.joins(:user_teams).where(:user_teams => {user_id: user_id, role_id: 1})
    end
end
