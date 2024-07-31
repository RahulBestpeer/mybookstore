require 'rails_helper'

RSpec.describe Order, type: :model do
  # Validations
  it 'is valid with valid attributes' do
    order = FactoryBot.build(:order)
    expect(order).to be_valid
  end

  it 'is invalid without a date_submit' do
    order = FactoryBot.build(:order, date_submit: nil)
    expect(order).not_to be_valid
    expect(order.errors[:date_submit]).to include("can't be blank")
  end

  it 'is invalid without a status' do
    order = FactoryBot.build(:order, status: nil)
    expect(order).not_to be_valid
    expect(order.errors[:status]).to include("can't be blank")
  end

  it 'is invalid with a non-integer status' do
    order = FactoryBot.build(:order, status: 'not an integer')
    expect(order).not_to be_valid
    expect(order.errors[:status]).to include('is not a number')
  end

  it 'is invalid without a subtotal' do
    order = FactoryBot.build(:order, subtotal: nil)
    expect(order).not_to be_valid
    expect(order.errors[:subtotal]).to include("can't be blank")
  end

  it 'is invalid with a non-numerical subtotal' do
    order = FactoryBot.build(:order, subtotal: 'not a number')
    expect(order).not_to be_valid
    expect(order.errors[:subtotal]).to include('is not a number')
  end

  it 'is invalid without a tax' do
    order = FactoryBot.build(:order, tax: nil)
    expect(order).not_to be_valid
    expect(order.errors[:tax]).to include("can't be blank")
  end

  it 'is invalid with a non-numerical tax' do
    order = FactoryBot.build(:order, tax: 'not a number')
    expect(order).not_to be_valid
    expect(order.errors[:tax]).to include('is not a number')
  end

  it 'is invalid without a total' do
    order = FactoryBot.build(:order, total: nil)
    expect(order).not_to be_valid
    expect(order.errors[:total]).to include("can't be blank")
  end

  it 'is invalid with a non-numerical total' do
    order = FactoryBot.build(:order, total: 'not a number')
    expect(order).not_to be_valid
    expect(order.errors[:total]).to include('is not a number')
  end

  it 'is invalid without shipping' do
    order = FactoryBot.build(:order, shipping: nil)
    expect(order).not_to be_valid
    expect(order.errors[:shipping]).to include("can't be blank")
  end

  it 'is invalid with a non-numerical shipping' do
    order = FactoryBot.build(:order, shipping: 'not a number')
    expect(order).not_to be_valid
    expect(order.errors[:shipping]).to include('is not a number')
  end

  # Associations
  it 'belongs to an account' do
    should belong_to(:account)
  end

  it 'has and belongs to many books' do
    should have_and_belong_to_many(:books)
  end

  # it 'cleans up associations before destroying' do
  #   order = FactoryBot.create(:order)
  #   expect(order.books.count).to be > 0
  #   order.destroy
  #   expect(order.books.count).to eq(0)
  # end

  # # Ensure the cleanup_associations method works correctly
  # it 'removes associated books on destroy' do
  #   order = FactoryBot.create(:order)
  #   books = order.books.to_a
  #   order.destroy
  #   expect(books).to be_empty
  # end
end
