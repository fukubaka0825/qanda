class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  mount_uploader :picture, PictureUploader
  
  validates :content, presence: true
  validates :name, presence: true
 
end
