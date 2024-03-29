# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

begin

  #publishers
  publisher1 = Publisher.create!(name: "Paste Magazine")
  publisher2 = Publisher.create!(name: "Publishers Weekly")
  publisher3 = Publisher.create!(name: "Graywolf Press")
  publisher4 = Publisher.create!(name: "McSweeney's")
  
  #books
  book1 = Book.create!(publisher: publisher1, title: "American Elf", isbn_10: "1-891-83085-6", isbn_13: "978-1-891830-85-3", publication_year: 2004, edition: "Book 2", list_price: 1000, image_url: "https://www.topshelfcomix.com/catalog/covers/american_elf_4_lg.jpg")
  book2 = Book.create!(publisher: publisher2, title: "Cosmoknights", isbn_10: "1-603-09454-7", isbn_13: "978-1-60309-454-2", publication_year: 2019, edition: "Book 1", list_price: 2000, image_url: "https://books.google.com.ph/books/publisher/content?id=ln6fDwAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&sig=ACfU3U1R197Y8wwEXeilY8nMYgY-dABzGw&w=1280")
  book3 = Book.create!(publisher: publisher3, title: "Essex County", isbn_10: "1-603-09038-X", isbn_13: "978-1-60309-038-4", publication_year: 1990, list_price: 500, image_url: "https://books.google.com.ph/books/content?id=bvI9nOzxcwoC&pg=PP1&img=1&zoom=3&hl=en&sig=ACfU3U3hKLO3Th53X60vGL3qSzFXgwvW2g&w=1280")
  book4 = Book.create!(publisher: publisher3, title: "Hey Mister (Vol 1)", isbn_10: "1-891-83002-3", isbn_13: "978-1-891830-02-0", publication_year: 2000, edition: "After School Special", list_price: 1200, image_url: "https://www.topshelfcomix.com/catalog/covers/afterschool_lg.jpg")
  book5 = Book.create!(publisher: publisher4, title: "The Underwater Welder", isbn_10: "1-603-09398-2", isbn_13: "978-1-60309-398-9", publication_year: 2004, edition: "Book 2", list_price: 1000, image_url: "../assets/the-underwater-welder.png")

  #authors
  author1 = Author.create!(first_name: "Joel", middle_name: "", last_name: "Hartse")
  author2 = Author.create!(first_name: "Hannah", middle_name: "P.", last_name: "Templer")
  author3 = Author.create!(first_name: "Marguerite", middle_name: "Z.", last_name: "Duras")
  author4 = Author.create!(first_name: "Kingsley", middle_name: "", last_name: "Amis")
  author5 = Author.create!(first_name: "Fannie", middle_name: "Peter", last_name: "Flagg")
  author6 = Author.create!(first_name: "Camille", middle_name: "Byron", last_name: "Paglia")
  author7 = Author.create!(first_name: "Rainer", middle_name: "Steel", last_name: "Rilke")


  #bookauthor
  book_author1 = BookAuthor.create!(book_id: book1.id, author_id: author1.id)
  book_author2 = BookAuthor.create!(book_id: book1.id, author_id: author2.id)
  book_author3 = BookAuthor.create!(book_id: book1.id, author_id: author3.id)
  book_author4 = BookAuthor.create!(book_id: book2.id, author_id: author4.id)
  book_author5 = BookAuthor.create!(book_id: book3.id, author_id: author4.id)
  book_author6 = BookAuthor.create!(book_id: book4.id, author_id: author2.id)
  book_author7 = BookAuthor.create!(book_id: book4.id, author_id: author5.id)
  book_author8 = BookAuthor.create!(book_id: book4.id, author_id: author6.id)
  book_author9 = BookAuthor.create!(book_id: book5.id, author_id: author7.id)
  # book_author9 = BookAuthor.create!(book_id: book7.id, author_id: author7.id)

rescue ActiveRecord::RecordInvalid => e
  puts "Error creating record: #{e.message}"
end
