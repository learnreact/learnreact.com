require "administrate/base_dashboard"

class LessonDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    course: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    video_embed: Field::Text,
    free: Field::Boolean,
    slug: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :title,
    :slug,
    :course,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :slug,
    :course,
    :description,
    :free,
  ].freeze

  FORM_ATTRIBUTES = [
    :title,
    :slug,
    :course,
    :description,
    :video_embed,
    :free,
  ].freeze

  def display_resource(lesson)
    "#{lesson.id} #{lesson.title}"
  end
end
