class User < ApplicationRecord
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
end
