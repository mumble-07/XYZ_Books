class Book < ApplicationRecord

  has_many :book_authors, dependent: :destroy
  has_many :books, through: :book_authors
  belongs_to :publisher

  validates :title, presence: true
  validates :list_price, presence: true
  validates :publication_year, presence: true
  validates :publisher, presence: true
  validate :isbn_presence_and_uniqueness

  private
# logic for presence of either isbn and it's uniqueness
  def isbn_presence_and_uniqueness
    unless isbn_10.present? || isbn_13.present?
      errors.add(:base, "ISBN-10 or ISBN-13 must be present")
    end

    # if isbn_10.present? && Book.where.not(id: id).exists?(isbn_10: isbn_10)
    #   errors.add(:isbn_10, "has already been taken")
    # end

    # if isbn_13.present? && Book.where.not(id: id).exists?(isbn_13: isbn_13)
    #   errors.add(:isbn_13, "has already been taken")
    # end
  end
end
