class IdeaLink < ActiveRecord::Base
    belongs_to :idea
    belongs_to :idea_linked, class_name: "Idea"
    belongs_to :user
    
    LINK_OPTIONS = [{value:0, label:"No Link"},{value:1, label:"Alternative"},{value:2, label:"Similar"},
            {value:4, label:"Parent"},{value:-4,label:"Component"}]

    
    def self.save_pair(idea_id, idea_linked_id, value, user_id)
        idea_link_original = self.find_or_initialize_by(idea_id: idea_id, idea_linked_id: idea_linked_id, user_id: user_id)
        idea_link_original.update_attributes(idea_id: idea_id, idea_linked_id: idea_linked_id, link_type: value, user_id: user_id, request_flag: 0)
        idea_link_pair = self.find_or_initialize_by(idea_id: idea_linked_id, idea_linked_id: idea_id, user_id: user_id)
        idea_link_pair.update_attributes(idea_id: idea_linked_id, idea_linked_id: idea_id, link_type: -value.to_i, user_id: user_id, request_flag: 1)
    end
    
end
