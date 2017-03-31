class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { maximum: 30 }
  validates :content, length: { maximum: 140 }
end
