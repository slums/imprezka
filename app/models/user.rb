class User < ActiveRecord::Base

  has_many :parties, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]  
      user.name = auth["user_info"]["name"]  
      user.first_name = auth["user_info"]["first_name"]
      user.last_name = auth["user_info"]["last_name"]
      user.gender = auth["extra"]["user_hash"]["gender"]
      user.verified = auth["extra"]["user_hash"]["verified"]
      user.fb_link = auth["extra"]["user_hash"]["link"]
      user.email = auth["extra"]["user_hash"]["email"]
      user.commercial = false
      user.is_active = true

      if (user.first_name == "")
        user.first_name = "bezimienny"
      end
      if (user.last_name == "")
        user.last_name = "bez nazwiska"
      end
      if (user.name == "")
        user.name = "John Doe"
      end

    end  
  end

end
