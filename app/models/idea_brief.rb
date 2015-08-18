class IdeaBrief < ActiveRecord::Base
    has_one :idea
    mount_uploader :avatar, AvatarUploader
    
    #Taggable
    acts_as_taggable
    acts_as_taggable_on :audience
    
end
