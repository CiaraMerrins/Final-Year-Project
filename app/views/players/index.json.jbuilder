json.array!(@players) do |player|
  json.extract! player, :id, :name, :email, :password_digest, :image, :gender, :dob, :sport1, :sport2
  json.url player_url(player, format: :json)
end
