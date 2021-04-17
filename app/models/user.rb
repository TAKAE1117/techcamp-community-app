class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # テーブル間のアソシエーション
  has_many :articles
  has_many :comments
  # // テーブル間のアソシエーション

  # active hashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :classroom
  belongs_to :course_style
  # // active hashのアソシエーション

  with_options presence: true do
    validates :email
    validates :password
    validates :nickname
    validates :time_to_attend
    validates :classroom_id
    validates :course_style_id
  end

  with_options numericality: { other_than: 0 } do
    validates :classroom_id
    validates :course_style_id
  end

  with_options format: { with: /\A[a-zA-Z0-9]+\z/ } do
    validates :password
  end

end
