require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    lessons: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    description: Field::String,
    hidden: Field::Boolean,
    slug: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    cover: Field::Text,
    free: Field::Boolean,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :title,
    :description,
    :lessons,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :slug,
    :description,
    :free,
    :hidden,
    :lessons,
  ].freeze

  FORM_ATTRIBUTES = [
    :title,
    :slug,
    :description,
    :free,
    :hidden,
    :lessons,
  ].freeze

  def display_resource(course)
    course.title
  end
end
