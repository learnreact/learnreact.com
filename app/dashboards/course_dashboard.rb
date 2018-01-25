require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    description: Field::Text,
    duration: Field::String,
    hidden: Field::Boolean,
    slug: Field::String,
    free: Field::Boolean,
    incomplete: Field::Boolean,
    lessons: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :title,
    :lessons,
    :slug,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :slug,
    :description,
    :duration,
    :free,
    :hidden,
    :lessons,
  ].freeze

  FORM_ATTRIBUTES = [
    :title,
    :slug,
    :description,
    :duration,
    :free,
    :incomplete,
    :hidden,
    :lessons,
  ].freeze

  def display_resource(course)
    course.title
  end
end
