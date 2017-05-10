require "administrate/base_dashboard"

class CourseDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
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
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :lessons,
    :id,
    :title,
    :description,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :lessons,
    :id,
    :title,
    :description,
    :hidden,
    :slug,
    :created_at,
    :updated_at,
    :cover,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :lessons,
    :title,
    :description,
    :hidden,
    :slug,
    :cover,
  ].freeze

  # Overwrite this method to customize how courses are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(course)
  #   "Course ##{course.id}"
  # end
end
