FactoryBot.define do
  factory :user do 
    email                 { Faker::Internet.free_email } 
    encrypted_password    { Faker::Internet.password(min_length: 6)}
    # password_confirmation { password }
    nickname              { Faker::Name.name }
    time_to_attend        { Faker::Number.between(from: 1, to: 10) }
    classroom_id          { Faker::Number.between(from: 1, to: 11) }
    course_style_id       { Faker::Number.between(from: 1, to: 2) }
  end
end