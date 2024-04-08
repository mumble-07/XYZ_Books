require 'rails_helper'

RSpec.describe Author, type: :model do
  it "must have a first name" do
    author = create(:author)
    expect(author.first_name).to be_present
  end

  it "can have a middle name" do
    author = create(:author)
    expect(author.middle_name.present? || author.middle_name == "").to eq(true)
  end

  it "must have a last name" do
    author = create(:author)
    expect(author.last_name).to be_present
  end

  it "must have associated books" do
    author = create(:author)
    expect(author.books).not_to be_empty
  end
end
