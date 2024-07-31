FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    number { Faker::PhoneNumber.phone_number[0..9] }
    address { Faker::Address.full_address }
    password { 'Password1!' }
    password_confirmation { 'Password1!' }
    type { 'User' } 
    
    
    after(:build) do |user|
      user.profile_image.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'boy.png')),
        filename: 'boy.png',
        content_type: 'image/png'
      )
    end
  end

  factory :account do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    number { Faker::PhoneNumber.phone_number[0..9] }
    address { Faker::Address.full_address }
    password { 'Password1!' }
    password_confirmation { 'Password1!' }
    type { 'User' } 
    
    
    after(:build) do |user|
      user.profile_image.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'boy.png')),
        filename: 'boy.png',
        content_type: 'image/png'
      )
    end
  end
end
