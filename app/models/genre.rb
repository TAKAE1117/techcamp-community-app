class Genre < ActiveHash::Base
  self.data = [
    { id: 0, genre_id: '--' },
    { id: 1, genre_id: '悩み' },
    { id: 2, genre_id: 'エラー' },
    { id: 3, genre_id: '技術内容' },
    { id: 4, genre_id: '恋愛' },
    { id: 5, genre_id: '人間関係' },
    { id: 6, genre_id: 'キャリア' },
    { id: 7, genre_id: '家庭' },
    { id: 8, genre_id: '体調' },
    { id: 9, genre_id: '自己実現' }
    { id: 9, genre_id: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :articles
 
  end