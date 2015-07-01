class IdeaTeam < ActiveRecord::Base
    belongs_to :team
    belongs_to :idea
end
