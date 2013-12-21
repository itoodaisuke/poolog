json.array!(@games) do |game|
  json.extract! game, :id, :name, :date, :place
  json.url game_url(game, format: :json)
end
