class Classroom < ActiveHash::Base
  self.data = [
    { id: 0, classroom_id: '--' },
    { id: 1, classroom_id: '渋谷アジアビル校' },
    { id: 2, classroom_id: '東京大手町校' },
    { id: 3, classroom_id: '名古屋栄校' },
    { id: 4, classroom_id: 'なんばスカイオ校' },
    { id: 5, classroom_id: '渋谷フォンティスビル校' },
    { id: 6, classroom_id: '渋谷フレーム神南坂校' },
    { id: 7, classroom_id: '東京丸の内校' },
    { id: 8, classroom_id: '近鉄難波ビル校' },
    { id: 9, classroom_id: '中洲校' },
    { id: 10, classroom_id: '天神校' },
    { id: 11, classroom_id: 'オンライン' }
  ]

  include ActiveHash::Associations
  has_many :users
  end