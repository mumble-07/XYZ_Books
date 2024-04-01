module SeedsServices
  class CreateBookAuthors < ApplicationService
    def call(books, authors)
      @logger.info 'Processing BookAuthor seed file'
      BookAuthor.destroy_all
      @logger.info 'Deleted all data from BookAuthor model'
      
      # Example code to create book authors
      book_authors_data = [
        { book: books[0], authors: [authors[0], authors[1], authors[2]] },
        { book: books[1], authors: [authors[3]] },
        { book: books[2], authors: [authors[3]] },
        { book: books[3], authors: [authors[1], authors[4], authors[5]] },
        { book: books[4], authors: [authors[6]] }
        # Add more book-author assignments as needed
      ]
      
      book_authors_data.each do |data|
        data[:authors].each do |author|
          BookAuthor.create!(book: data[:book], author: author)
        end
      end

      @logger.info 'BookAuthor has been created'
    end
  end
end
