class Question < ApplicationRecord
    has_many :answers,dependent: :destroy
    
    mount_uploader :picture, PictureUploader
    
    validates :name, presence: true
    validates :title, presence: true
    validates :content, presence: true
end
