# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed process should be made from a different file under services folder.
# Use namespacing for a more readable code
begin

  #publishers
  #books
  #authors
  #bookauthor

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
