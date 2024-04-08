require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it "must have associated books" do
    publisher = create(:publisher)
    book = create(:book, publisher: publisher)
    expect(publisher.books.count).to eq(1)
  end
end
