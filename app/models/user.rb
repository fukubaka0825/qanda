class User < ApplicationRecord
    has_secure_password
    
    validates :name,
    #ユーザ名必須、重複防ぐ
    presence: true,
    uniquness: true,
    length: { maximum: 16 },
    format: {
        # 小文字英数字の正規表現
        with: /¥A[a-z0-9]+¥z/,
        message: 'は小文字英数字で入力してください'
    }
    validates :password,
    length: { minimum: 8 }
end
