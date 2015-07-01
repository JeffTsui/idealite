class Idea < ActiveRecord::Base
    belongs_to :idea_brief
    has_many :idea_teams
    has_many :teams, :through => :idea_teams
end
