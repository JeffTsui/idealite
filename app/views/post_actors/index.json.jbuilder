json.array!(@post_actors) do |post_actor|
  json.extract! post_actor, :id, :post_id, :post_actor_type, :post_actor_id
  json.url post_actor_url(post_actor, format: :json)
end
