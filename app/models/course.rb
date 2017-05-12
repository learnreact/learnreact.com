class Course < ApplicationRecord
  has_many :lessons

  validates_presence_of :slug

  def preview_length
    4
  end

  def price
    700
  end

  def to_param
    "#{slug}"
  end
end
