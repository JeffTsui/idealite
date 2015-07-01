json.array!(@ideas) do |idea|
  json.extract! idea, :id, :title, :detail, :owner_id
  json.url idea_url(idea, format: :json)
end
