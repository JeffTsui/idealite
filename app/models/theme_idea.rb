class ThemeIdea < ActiveRecord::Base
    LINK_OPTIONS = [{value:0, label:"Not Applied"},{value:1, label:"Apply"}]
    
    belongs_to :theme
    belongs_to :idea
    belongs_to :user
end
