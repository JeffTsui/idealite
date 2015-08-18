json.array!(@milestones) do |milestone|
  json.extract! milestone, :id, :idea_id, :start_date, :end_date, :progress, :title, :detail, :critical_flag
  json.url milestone_url(milestone, format: :json)
end
