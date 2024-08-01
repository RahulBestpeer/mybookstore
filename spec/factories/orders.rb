FactoryBot.define do
  factory :order do
    date_submit { Faker::Date.between(from: 2.days.ago, to: Date.today) }
    status { 0 } # Pending
    subtotal { Faker::Commerce.price(range: 10.0..100.0) }
    tax { Faker::Commerce.price(range: 1.0..10.0) }
    total { 100 }
    shipping { Faker::Commerce.price(range: 5.0..20.0) }
    association :account

    # Association with books
    after(:create) do |order|
      books = FactoryBot.create_list(:book, 3)
      order.books << books
    end
  end
end
