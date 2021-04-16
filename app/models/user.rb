class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  has_many :comments

  with_options presence: true do
    validates :email
    validates :password
    validates :nickname
    validates :time_to_attend
    validates :classroom
    validates :course_style
  end
end
