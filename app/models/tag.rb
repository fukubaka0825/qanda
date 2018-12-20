class Tag < ApplicationRecord
    # 親が死んだら子も死ぬ設定　dependent
    has_many :question_tag_relations,dependent: :delete_all
    # 多対多リレーションの際、中間テーブル経由であることをthroughで明記
    has_many :questions, through: :question_tag_relations
end
