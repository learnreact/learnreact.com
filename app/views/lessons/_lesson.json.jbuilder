json.extract! lesson, :id, :course_id, :title, :description, :video_embed, :transcript, :free, :slug, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)
