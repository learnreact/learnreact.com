class User < ApplicationRecord
  has_many :purchases
  has_many :courses, through: :purchases
  has_one :subscription

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.provider_id = auth["uid"]
      if auth["info"]
         user.name = auth["info"]["name"] || ""
         user.nickname = auth["info"]["nickname"] || ""
         user.email = auth["info"]["email"] || ""
         user.avatar_url = auth["info"]["image"] || ""
      end
    end
  end

  def can_access_course?(course)
    if course.free || self.subscription.present? || self.courses.include?(course)
      return true
    else
      return false
    end
  end

  def can_access_lesson?(lesson)
    if lesson.free || self.subscription.present? || self.courses.include?(lesson.course)
      return true
    else
      return false
    end
  end
end
