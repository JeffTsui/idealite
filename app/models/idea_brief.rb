class IdeaBrief < ActiveRecord::Base
    has_one :idea
    mount_uploader :avatar, AvatarUploader
    
end
