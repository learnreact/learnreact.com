class Course < ApplicationRecord
  has_many :lessons

  validates_presence_of :slug

  def self.visible
    where(hidden: false)
  end

  def preview_length
    4
  end

  def price
    400
  end

  def to_param
    "#{slug}"
  end
end
