class Idea < ActiveRecord::Base
    belongs_to :user
    belongs_to :idea_brief
    has_many :idea_teams
    has_many :teams, :through => :idea_teams
    has_many :post_actors, :as => :post_actor
    has_many :posts
    
    def is_my_idea?(user_id)
        @idea_team_ids = self.teams.map{|i| i.id}
        @user_team_ids = User.find(user_id).teams.map{|i| i.id}
        logger.debug "overlapped teams: #{(@user_team_ids & @idea_team_ids)}".light_yellow
        logger.debug "onwer user id: #{user.id.to_s.light_yellow}".light_yellow
        #in idea teams or creator of the idea
        !(@user_team_ids & @idea_team_ids).empty? || self.user.id == user_id
    end
    
    def is_team_idea?(team_id)
        @idea_team_ids = self.teams.map{|i| i.id}
        @idea_team_ids.include? team_id
    end
    
    #Teams belong to idea and user both
    def my_idea_teams(user_id)
        self.teams & User.find(user_id).teams
    end
end
