class ContentAccessUser < SimpleDelegator
  def has_subscription?
    if self.present? && self.subscription.present?
      return true
    else
      return false
    end
  end

  def can_access_course?(course)
    if self.present? && (self.subscription.present? || self.courses.include?(course))
      return true
    else
      return false
    end
  end

  def can_access_lesson?(lesson)
    if self.present? && (self.subscription.present? || self.courses.include?(lesson.course))
      return true
    else
      return false
    end
  end
end