class CourseStyle < ActiveHash::Base
  self.data = [
    { id: 0, course_style_id: '--' },
    { id: 1, course_style_id: '短期集中スタイル' },
    { id: 2, course_style_id: '夜間休日スタイル' }
  ]

  include ActiveHash::Associations
  has_many :users
  end