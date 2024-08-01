FactoryBot.define do
  factory :cart do
    association :account
    book_id { Faker::Number.number(digits: 5) } # Adjust based on your book_id format

    # If you have any other attributes, define them here
  end
end
