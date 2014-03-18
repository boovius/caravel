class Widget < ActiveRecord::Base

  has_many   :features
  belongs_to :user

  accepts_nested_attributes_for :features

  validates_uniqueness_of :title
  validates_presence_of   :user_id
end
