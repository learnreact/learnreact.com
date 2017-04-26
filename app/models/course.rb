class Course < ApplicationRecord
  has_many :lessons

  validates_presence_of :slug

  def to_param
    "#{slug}"
  end
end
