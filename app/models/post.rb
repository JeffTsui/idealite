class Post < ActiveRecord::Base
    has_one :post_actor
    belongs_to :idea
    belongs_to :user
end
