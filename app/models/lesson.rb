class Lesson < ApplicationRecord
  belongs_to :course

  validates_presence_of :slug

  def to_param
    "#{slug}"
  end
end
