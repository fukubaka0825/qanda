# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 開発環境指定
if Rails.env == 'development'
    (1..50).each do|i|
    Question.create(name: "ユーザー#{i}",title: "タイトル#{i}" ,content: "本文#{i}")
  end
end
#   ハッシュで渡すと複数追加
   Tag.create([
       {name: 'コム・デ・ギャルソン'},
       {name: 'ユニクロ' },
       {name: '古着' },
       {name: 'GU' },
       {name: 'digawal' },
       {name: 'gosharubchinsky' }
      ]
   )
