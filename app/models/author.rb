class Author < ApplicationRecord

  has_many :book_author, dependent: :destroy
  has_many :books, through: :book_author

  validates :first_name, presence: true
  validates :last_name, presence: true
end
