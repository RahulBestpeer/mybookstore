class Cart < ApplicationRecord
	 belongs_to :account

	 validates :book_id, presence:true
	 
end
