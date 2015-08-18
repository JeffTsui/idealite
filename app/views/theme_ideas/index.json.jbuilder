json.array!(@theme_ideas) do |theme_idea|
  json.extract! theme_idea, :id, :theme_id, :idea_id, :score
  json.url theme_idea_url(theme_idea, format: :json)
end
