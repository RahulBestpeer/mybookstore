class Order < ApplicationRecord
  has_and_belongs_to_many :books 
  belongs_to :account
  # enum :status, {Pending:0, Processing:1, Delivered:2}  

  before_destroy :cleanup_associations

  validates :date_submit, presence:true
  validates :status, presence: true, numericality: {only_integer: true}
  validates :subtotal, presence:true, numericality: true
  validates :tax, presence:true, numericality: true
  validates :total, presence:true, numericality: true
  validates :shipping, presence:true, numericality: true


    def cleanup_associations
        # Remove associations from the join table
        books.clear
    end
end
