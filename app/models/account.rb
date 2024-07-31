class Account < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :carts, dependent: :destroy


 has_one_attached :profile_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable


  validates :number, presence:true, length:{ is: 10}
  validates :type, presence:true
  validates :name, presence:true
  validates :address, presence:true, length:{ in: 10..100 }
 

end
