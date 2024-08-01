require 'rails_helper'

RSpec.describe Cart, type: :model do
  # Validations
  it 'is valid with valid attributes' do
    cart = FactoryBot.build(:cart)
    expect(cart).to be_valid
  end

  it 'is invalid without a book_id' do
    cart = FactoryBot.build(:cart, book_id: nil)
    expect(cart).not_to be_valid
    expect(cart.errors[:book_id]).to include("can't be blank")
  end

  # Associations
  it 'belongs to an account' do
    should belong_to(:account)
  end

  # Optional: If you have additional tests for associations
  it 'is invalid without an associated account' do
    cart = FactoryBot.build(:cart, account: nil)
    expect(cart).not_to be_valid
    expect(cart.errors[:account]).to include('must exist')
  end
end
