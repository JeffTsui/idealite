class Follow < Socialization::ActiveRecordStores::Follow
    belongs_to :followable, :polymorphic => true
end
