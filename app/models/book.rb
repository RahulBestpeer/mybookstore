class Book < ApplicationRecord
	has_and_belongs_to_many :orders
	belongs_to :author
	has_one_attached :image
	
	before_destroy :cleanup_associations


	validates :title, presence:true, uniqueness:true
	validates :description, presence:true, length:{in: 10..500}
	validates :price, presence:true, numericality: true
	validates :stock_quntity, presence:true, numericality: { only_integer: true }


	def cleanup_associations
    	# Remove associations from the join table
   		orders.clear
	end
end
