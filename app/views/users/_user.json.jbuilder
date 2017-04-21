json.extract! user, :id, :github, :name, :email, :avatar_url, :created_at, :updated_at
json.url user_url(user, format: :json)
