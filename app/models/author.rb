class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true, uniqueness: true
  validates :dob, presence: true
end
