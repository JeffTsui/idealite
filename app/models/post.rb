class Post < ActiveRecord::Base
    has_one :post_actor
    belongs_to :idea
    belongs_to :user
    acts_as_commentable
    acts_as_mentioner
end
