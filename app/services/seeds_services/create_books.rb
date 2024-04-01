module SeedsServices
  class CreateBooks < ApplicationService
    def call(publisher1:, publisher2:, publisher3:, publisher4:)
      @logger.info 'Processing Admin seed file'
      Book.destroy_all
      @logger.info 'Deleted all data from Book model'
      
      book1 = Book.create!(publisher: publisher1, title: "American Elf", isbn_10: "1-891-83085-6", isbn_13: "978-1-891830-85-3", publication_year: 2004, edition: "Book 2", list_price: 1000, image_url: "https://www.lambiek.net/share/image.php/american-elf--book-4-.jpg?width=350&image=/catalog/img/1023--50561-800-r8u.jpg")
      book2 = Book.create!(publisher: publisher2, title: "Cosmoknights", isbn_10: "1-603-09454-7", isbn_13: "978-1-60309-454-2", publication_year: 2019, edition: "Book 1", list_price: 2000, image_url: "https://ecsmedia.pl/c/cosmoknights-book-one-b-iext118729495.jpg")
      book3 = Book.create!(publisher: publisher3, title: "Essex County", isbn_10: "1-603-09038-X", isbn_13: "978-1-60309-038-4", publication_year: 1990, edition: "", list_price: 500, image_url: "https://www.hollywoodreporter.com/wp-content/uploads/2015/12/essex_county_cover_-_p_2015.jpg?w=1024")
      book4 = Book.create!(publisher: publisher3, title: "Hey Mister (Vol 1)", isbn_10: "1-891-83002-3", isbn_13: "978-1-891830-02-0", publication_year: 2000, edition: "After School Special", list_price: 1200, image_url: "https://www.topshelfcomix.com/catalog/covers/afterschool_lg.jpg")
      book5 = Book.create!(publisher: publisher4, title: "The Underwater Welder", isbn_10: "1-603-09398-2", isbn_13: "978-1-60309-398-9", publication_year: 2022, edition: "", list_price: 3000, image_url: "https://d1466nnw0ex81e.cloudfront.net/n_iv/600/3569483.jpg")

      @logger.info 'Book has been created'
    end
  end
end
