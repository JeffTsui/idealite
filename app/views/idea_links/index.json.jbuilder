json.array!(@idea_links) do |idea_link|
  json.extract! idea_link, :id, :idea_source_id, :idea_target_id, :user_id
  json.url idea_link_url(idea_link, format: :json)
end
