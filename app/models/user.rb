class User < ActiveRecord::Base

  has_many   :apps

  validates_uniqueness_of :name

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth['uid']
      user.name = auth['info']['nickname'] || auth['info']['name'] || auth['info']['email']
    end
  end
end
