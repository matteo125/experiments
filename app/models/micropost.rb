class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { maximum: 30 }
  validates :content, length: { maximum: 500 }

  # before_save :assign_user_id, on: :create

  # def self.assign_user_id
  #   self.user_id = current_user.id
  # end
end
