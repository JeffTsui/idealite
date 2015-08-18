class Milestone < ActiveRecord::Base
    validates :title, presence: true
    
    belongs_to :idea
end
