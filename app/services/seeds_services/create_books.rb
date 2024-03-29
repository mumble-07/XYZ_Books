module SeedsServices
  class CreateBooks < ApplicationService
    def call(publisher1:, publisher2:, publisher3:, publisher4:)
      @logger.info 'Processing Admin seed file'
      Book.destroy_all
      @logger.info 'Deleted all data from Book model'
      
      book1 = Book.create!(publisher: publisher1, title: "American Elf", isbn_10: "1-891-83085-6", isbn_13: "978-1-891830-85-3", publication_year: 2004, edition: "Book 2", list_price: 1000, image_url: "https://www.topshelfcomix.com/catalog/covers/american_elf_4_lg.jpg")
      book2 = Book.create!(publisher: publisher2, title: "Cosmoknights", isbn_10: "1-603-09454-7", isbn_13: "978-1-60309-454-2", publication_year: 2019, edition: "Book 1", list_price: 2000, image_url: "https://books.google.com.ph/books/publisher/content?id=ln6fDwAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&sig=ACfU3U1R197Y8wwEXeilY8nMYgY-dABzGw&w=1280")
      book3 = Book.create!(publisher: publisher3, title: "Essex County", isbn_10: "1-603-09038-X", isbn_13: "978-1-60309-038-4", publication_year: 1990, list_price: 500, image_url: "https://books.google.com.ph/books/content?id=bvI9nOzxcwoC&pg=PP1&img=1&zoom=3&hl=en&sig=ACfU3U3hKLO3Th53X60vGL3qSzFXgwvW2g&w=1280")
      book4 = Book.create!(publisher: publisher3, title: "Hey Mister (Vol 1)", isbn_10: "1-891-83002-3", isbn_13: "978-1-891830-02-0", publication_year: 2000, edition: "After School Special", list_price: 1200, image_url: "https://www.topshelfcomix.com/catalog/covers/afterschool_lg.jpg")
      book5 = Book.create!(publisher: publisher4, title: "The Underwater Welder", isbn_10: "1-603-09398-2", isbn_13: "978-1-60309-398-9", publication_year: 2004, edition: "Book 2", list_price: 1000, image_url: "../assets/the-underwater-welder.png")

      @logger.info 'Book has been created'
    end
  end
end
