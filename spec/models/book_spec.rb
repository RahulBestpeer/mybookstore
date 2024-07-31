require 'rails_helper'

RSpec.describe Book, type: :model do

	
	it { should have_and_belong_to_many(:orders) }
	it { should belong_to(:author) }
	it { should have_one_attached(:image) }
	


	it 'is valid with valid attributes' do
		book = FactoryBot.build(:book)
		expect(book).to be_valid
	end

	it 'is invalid without a title' do
		book = FactoryBot.build(:book, title: nil)
		expect(book).not_to be_valid
		expect(book.errors[:title]).to include("can't be blank")
	end

	it 'is invalid with a duplicate title' do
		FactoryBot.create(:book, title: 'Unique Title')
		book = FactoryBot.build(:book, title: 'Unique Title')
		expect(book).not_to be_valid
		expect(book.errors[:title]).to include('has already been taken')
	end

	it 'is invalid without a description' do
		book = FactoryBot.build(:book, description: nil)
		expect(book).not_to be_valid
		expect(book.errors[:description]).to include("can't be blank")
	end

	it 'is invalid with a description shorter than 10 characters' do
		book = FactoryBot.build(:book, description: 'Short')
		expect(book).not_to be_valid
		expect(book.errors[:description]).to include('is too short (minimum is 10 characters)')
	end

	it 'is invalid with a description longer than 500 characters' do
		long_description = 'A' * 501
		book = FactoryBot.build(:book, description: long_description)
		expect(book).not_to be_valid
		expect(book.errors[:description]).to include('is too long (maximum is 500 characters)')
	end

	it 'is invalid without a price' do
		book = FactoryBot.build(:book, price: nil)
		expect(book).not_to be_valid
		expect(book.errors[:price]).to include("can't be blank")
	end

	it 'is invalid with a non-numerical price' do
		book = FactoryBot.build(:book, price: 'not a number')
		expect(book).not_to be_valid
		expect(book.errors[:price]).to include('is not a number')
	end

	it 'is invalid without stock quantity' do
		book = FactoryBot.build(:book, stock_quntity: nil)
		expect(book).not_to be_valid
		expect(book.errors[:stock_quntity]).to include("can't be blank")
	end

	it 'is invalid with a non-integer stock quantity' do
		book = FactoryBot.build(:book, stock_quntity: 10.5)
		expect(book).not_to be_valid
		expect(book.errors[:stock_quntity]).to include('must be an integer')
	end

  # Ensure the before_destroy callback works
  describe 'callbacks' do
  	it 'calls cleanup_associations before destroying a book' do
  		book = FactoryBot.create(:book)
  		expect(book).to receive(:cleanup_associations)
  		book.destroy
  	end
  end
end
