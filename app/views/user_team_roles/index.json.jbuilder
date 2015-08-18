json.array!(@user_team_roles) do |user_team_role|
  json.extract! user_team_role, :id, :team_id, :role, :desc, :open_flag
  json.url user_team_role_url(user_team_role, format: :json)
end
