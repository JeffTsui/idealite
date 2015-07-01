json.array!(@idea_briefs) do |idea_brief|
  json.extract! idea_brief, :id, :title, :problem, :target, :how, :result, :risk, :user_id
  json.url idea_brief_url(idea_brief, format: :json)
end
