module SeedsServices
  class CreateBookAuthors < ApplicationService
    def call(books, authors)
      @logger.info 'Processing BookAuthor seed file'
      BookAuthor.destroy_all
      @logger.info 'Deleted all data from BookAuthor model'
      
      # Example code to create book authors
      books.each_with_index do |book, index|
        author = authors[index % authors.size]
        BookAuthor.create!(book_id: book.id, author_id: author.id)
      end

      @logger.info 'BookAuthor has been created'
    end
  end
end
