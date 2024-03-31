begin

  # First, create publishers
  SeedsServices::CreatePublishers.new.call

# Then, pass the publishers when calling the CreateBooks service
  SeedsServices::CreateBooks.new.call(
    publisher1: Publisher.find_by(name: "Paste Magazine"),
    publisher2: Publisher.find_by(name: "Publishers Weekly"),
    publisher3: Publisher.find_by(name: "Graywolf Press"),
    publisher4: Publisher.find_by(name: "McSweeney's")
  )

  SeedsServices::CreateAuthors.new.call
  # Then, pass books and authors when calling the CreateBookAuthors service
  book_authors_service = SeedsServices::CreateBookAuthors.new
  books = Book.all
  authors = Author.all
  book_authors_service.call(books, authors)

rescue ActiveRecord::RecordInvalid => e
  puts "Error creating record: #{e.message}"
end
