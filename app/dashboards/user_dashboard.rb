require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    provider: Field::String,
    provider_id: Field::Number,
    name: Field::String,
    nickname: Field::String,
    email: Field::String,
    avatar_url: Field::String,
    purchases: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :name,
    :nickname,
    :created_at,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :provider,
    :provider_id,
    :name,
    :nickname,
    :email,
    :avatar_url,
    :purchases,
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :nickname,
    :email,
  ].freeze

  def display_resource(user)
    user.nickname
  end
end
