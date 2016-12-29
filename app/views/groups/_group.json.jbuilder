json.extract! group, :id, :created_at, :updated_at
json.url tournament_group_url(@tournament, group, format: :json)
