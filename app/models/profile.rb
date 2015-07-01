class Profile < ActiveRecord::Base
    belongs_to :profile, :polymorphic => true
end
