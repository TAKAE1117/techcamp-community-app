class Article < ApplicationRecord

  # テーブル感のアソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  # // テーブル感のアソシエーション

  # active hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  # // active hashのアソシエーション
  
  with_options presence: true do
    validates :title
    validates :genre_id
    validates :text
  end

  with_options numericality: { other_than: 0 } do
    validates :genre_id
  end
end
