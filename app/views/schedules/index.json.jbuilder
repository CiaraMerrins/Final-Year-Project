json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :description, :image, :section_id
  json.url schedule_url(schedule, format: :json)
end
