json.extract! tournament, :id, :no, :description, :date, :created_at, :updated_at
json.url tournament_url(tournament, format: :json)