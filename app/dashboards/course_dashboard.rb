require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    hidden: Field::Boolean,
    slug: Field::String,
    cover: Field::Text,
    free: Field::Boolean,
    lessons: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
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
