json.array!(@idea_teams) do |idea_team|
  json.extract! idea_team, :id, :idea_id, :team_id, :role_id
  json.url idea_team_url(idea_team, format: :json)
end
