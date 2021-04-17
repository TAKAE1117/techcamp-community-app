class Article < ApplicationRecord

  # テーブル感のアソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy
  # // テーブル感のアソシエーション

  # active hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  # // active hashのアソシエーション
  
end
