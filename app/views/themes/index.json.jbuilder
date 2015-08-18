json.array!(@themes) do |theme|
  json.extract! theme, :id, :topic, :reward, :policy, :type, :privacy_flag, :start_time, :end_time, :user_id, :team_id
  json.url theme_url(theme, format: :json)
end
