class PostActor < ActiveRecord::Base
    belongs_to :post_actor, :polymorphic=>true
    belongs_to :post
end
