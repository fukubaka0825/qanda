class Question < ApplicationRecord
    has_many :answers,dependent: :delete_all
    belongs_to :user
    # 関連がそこまで複雑でないなら一気に消せるdelete_allがパフォーマンスよし
    #一個づつ消していくのがdestroy
    has_many :question_tag_relations,dependent: :delete_all
    has_many :tags, through: :question_tag_relations
    
    mount_uploader :picture, PictureUploader
    
    validates :name, presence: true
    validates :title, presence: true
    validates :content, presence: true
end
