json.extract! course, :id, :title, :description, :image_url, :hidden, :slug, :created_at, :updated_at
json.url course_url(course, format: :json)
