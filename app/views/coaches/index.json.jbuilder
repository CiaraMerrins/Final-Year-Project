json.array!(@coaches) do |coach|
  json.extract! coach, :id, :name, :email, :password_digest, :image, :gender, :sport_id
  json.url coach_url(coach, format: :json)
end
