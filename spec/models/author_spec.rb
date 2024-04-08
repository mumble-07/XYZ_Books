require 'rails_helper'

RSpec.describe Author, type: :model do
  it "must have a first name" do
    author = create(:author)
    expect(author.first_name).to be_present
  end

  it "can have a middle name" do
    author = create(:author)
    expect(author.middle_name).to be_present
  end

  it "must have a last name" do
    author = create(:author)
    expect(author.last_name).to be_present
  end

  it "must have a book_id" do
    author = create(:author)
    expect(author.book_id).to be_present
  end
end
