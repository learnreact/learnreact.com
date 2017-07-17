class Lesson < ApplicationRecord
  belongs_to :course

  validates_presence_of :slug

  def self.default_scope
    order(created_at: :asc)
  end

  def to_param
    "#{slug}"
  end
end
