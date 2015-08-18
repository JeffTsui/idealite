class Theme < ActiveRecord::Base
    attr_default :privacy_flag, 2 #set default privacy to public
    
    has_many :theme_ideas, ->{where("theme_ideas.link_type <> 0")}
    has_many :ideas, through: :theme_ideas
    
    #Socialization
    acts_as_followable
    acts_as_likeable
    acts_as_mentionable
    has_many :follows, :as => :followable
    scope :top10_followed, -> {joins(:follows).group("themes.id").order("count(follows.id) desc").limit(10)}
    
    def self.my_themes_top_all(user_id)
        Theme.all #to-do
    end
    
    def link_value(idea_id, user_id)
        theme_link = ThemeIdea.where("theme_id = ? and idea_id = ? and user_id = ?", self.id, idea_id, user_id).first
        value = theme_link.nil?? 0 : theme_link.link_type
        return value
    end
    
    def apply_idea(idea_id, user_id, link_type)
        theme_idea = ThemeIdea.find_or_initialize_by(theme_id: self.id, idea_id: idea_id, user_id: user_id)
        theme_idea.update_attributes(theme_id: self.id, idea_id: idea_id, user_id: user_id, link_type: link_type)
    end

end