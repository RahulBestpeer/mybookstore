FactoryBot.define do
	factory :book do
		title { Faker::Book.title }
		description { Faker::Lorem.paragraph_by_chars(number: rand(10..500)) }
		price { Faker::Commerce.price(range: 1..1000.0, as_string: true) }
		stock_quntity { Faker::Number.between(from: 1, to: 100) }
		author




    # For Active Storage
    after(:build) do |product|
      # Use the path to your fixture image
      product.image.attach(
      	io: File.open(Rails.root.join('spec', 'factories', 'book.jpg')),
      	filename: 'book.jpg',
      	content_type: 'image/jpg'
      	)
  end
end

end
