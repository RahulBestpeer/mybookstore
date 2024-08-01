require 'rails_helper'

RSpec.describe User, type: :model do
  # # Validations
  # it 'is valid with valid attributes' do
  #   user = FactoryBot.build(:user)
  #   expect(user).to be_valid
  # end

  it 'is invalid without a number' do
    user = FactoryBot.build(:user, number: nil)
    expect(user).not_to be_valid
    expect(user.errors[:number]).to include("can't be blank")
  end

  it 'is invalid with a number not exactly 10 characters' do
    user = FactoryBot.build(:user, number: '12345')
    expect(user).not_to be_valid
    expect(user.errors[:number]).to include('is the wrong length (should be 10 characters)')
  end

  it 'is invalid without a type' do
    user = FactoryBot.build(:user, type: nil)
    expect(user).not_to be_valid
    expect(user.errors[:type]).to include("can't be blank")
  end

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an address' do
    user = FactoryBot.build(:user, address: nil)
    expect(user).not_to be_valid
    expect(user.errors[:address]).to include("can't be blank")
  end

  it 'is invalid with an address shorter than 10 characters' do
    user = FactoryBot.build(:user, address: 'Short dr')
    expect(user).not_to be_valid
    expect(user.errors[:address]).to include('is too short (minimum is 10 characters)')
  end

  it 'is invalid with an address longer than 500 characters' do
    long_address = 'A' * 500
    user = FactoryBot.build(:user, address: long_address)
    expect(user).not_to be_valid
    expect(user.errors[:address]).to include('is too long (maximum is 100 characters)')
  end

  # Associations
  # it 'destroys associated orders when destroyed' do
  #   user = FactoryBot.create(:user)
  #   FactoryBot.create(:order, user: user)
  #   expect { user.destroy }.to change { Order.count }.by(-1)
  # end

  # it 'destroys associated carts when destroyed' do
  #   user = FactoryBot.create(:user)
  #   FactoryBot.create(:cart, user: user)
  #   expect { user.destroy }.to change { Cart.count }.by(-1)
  # end

  # # Attachment
  it 'has an attached profile_image' do
    user = FactoryBot.build(:user)
    expect(user.profile_image).to be_attached
  end

  it 'can access the thumb variant of profile_image' do
    user = FactoryBot.build(:user)
    expect(user.profile_image.variant(:thumb)).to be_present
  end

  # Devise modules
  it 'includes Devise modules' do
    expect(User.devise_modules).to include(:database_authenticatable, :registerable, :recoverable, :rememberable,
                                           :validatable, :confirmable)
  end
end
