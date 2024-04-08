require 'rails_helper'

RSpec.describe Book, type: :model do
  it "must have a book title" do
    book1 = create(:book)
    expect(book1.title).to be_present
  end

  it "can have an ISBN-10 or ISBN-13" do
    book = create(:book)
    expect(book.isbn_10.present? || book.isbn_13.present?).to eq(true)
  end

  it "must have a Price" do
    book = create(:book)
    expect(book.list_price).to be_present
  end

  it "must have a publisher" do
    book = create(:book)
    expect(book.publisher).to be_present
  end
end
