require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "this test should not save because there is no book title" do
    book1 = Book.new
    # book1.title = "American Elf"
    book1.isbn_10 = "1-891-83085-6"

    # book1.isbn_10 = "1-891-83085-6"
    # book1.isbn_13 = "978-1-891830-85-3"
    # book1.list_price = 1000
    # book1.publication_year = 2004
    # book1.publisher = "Paste Magazine"
    # book1.edition = "Book 2"
    # book1.image_url = "https://www.google.com/"

    assert_not book1.save, "Saved the book without the book name"
  end

  test "this test should not save because there is no book list price" do
    book1 = Book.new
    book1.title = "American Elf"
    # book1.list_price = 1000

    assert_not book1.save, "Saved the book without the book list price"
  end

  test "this test should not save because there is no book isbn-10 or isbn-13" do
    book1 = Book.new
    book1.title = "American Elf"
    # book1.isbn_10 = "1-891-83085-6"
    # book1.isbn_13 = "978-1-891830-85-3"

    assert_not book1.save, "Saved the book without the book isbn-10 or isbn-13"
  end

  test "this test should not save because there is a duplicate in isbn-10" do
    book1 = Book.new(
      title: "American Elf1",
      list_price: 1000,
      isbn_10: "1-891-83085-6"
    )
    book1.save

    book2 = Book.new
    book2.title = "American Elf2"
    book2.list_price = 1000
    book2.isbn_10 = "1-891-83085-6"

    assert_not book2.save, "Saved the book with duplicate in isbn-10"
  end

  test "this test should not save because there is a duplicate in isbn-13" do
    book2 = Book.new(
      title: "American Elf1",
      list_price: 1000,
      isbn_13: "978-1-891830-85-3"
    )
    book2.save

    book3 = Book.new(
      title: "American Elf2",
      list_price: 1000,
      isbn_13: "978-1-891830-85-3"
    )
    book3.save

    assert_not book3.save, "Saved the book with duplicate in isbn-13"
  end

  test "this test should not save because there is no book publication year" do
    book1 = Book.new
    book1.title = "American Elf"
    book1.isbn_10 = "1-891-83085-6"
    book1.list_price = 1000
    # book1.publication_year = 2004

    assert_not book1.save, "Saved the book without the publication year"
  end

  test "this test should not save because there is no book publisher" do
    book1 = Book.new
    book1.title = "American Elf"
    book1.isbn_10 = "1-891-83085-6"
    book1.list_price = 1000
    book1.publication_year = 2004
    # book1.publisher = "Paste Magazine"
    
    assert_not book1.save, "Saved the book without the book publisher"
  end
end
