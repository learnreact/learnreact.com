require "administrate/base_dashboard"

class PurchaseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    course: Field::BelongsTo,
    id: Field::Number,
    charge_token: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :user,
    :course,
    :charge_token,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :course,
    :charge_token,
    :created_at,
  ].freeze

  FORM_ATTRIBUTES = [
  ].freeze

  def display_resource(purchase)
    "Purchase by #{purchase.user.nickname}"
  end
end
