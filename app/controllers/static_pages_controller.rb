class StaticPagesController < ApplicationController
  
  def index
  end

  def convert_isbn
    parameter = params[:isbn].delete('-')
  
    if ISBN_Tools.is_valid?(parameter)
      result = if parameter.length == 13
                 ISBN_Tools.isbn13_to_isbn10(parameter)
               elsif parameter.length == 10
                 ISBN_Tools.isbn10_to_isbn13(parameter)
               end
  
      hyphenated_result = hyphenate_isbn(result)
      render plain: hyphenated_result
    else
      render_error_page(400)
    end
  end

  def hyphenate_isbn(isbn)
    if isbn.length == 13
      hyphenated_isbn = ISBN_Tools.hyphenate_isbn13(isbn)
    elsif isbn.length == 10
      hyphenated_isbn = ISBN_Tools.hyphenate_isbn10(isbn)
    end
  
    hyphenated_isbn || isbn # Return the hyphenated ISBN or original ISBN if no hyphenation was done
  end

  def search
    parameter = params[:search]
  
    if ISBN_Tools.is_valid?(parameter)
      @results = Book.where("books.isbn_10 LIKE ? OR books.isbn_13 LIKE ?", "%#{parameter}%", "%#{parameter}%")
      
      if @results.empty?
        render_error_page(404)
      end
    else
      render_error_page(400)
    end
  end
  

  def api_book
    parameter = params[:isbn]
    results = Book.where("books.isbn_10 LIKE ? OR books.isbn_13 LIKE ?", "%#{parameter}%", "%#{parameter}%")
    
    puts "Results size: #{results.size}" # Debugging statement
  
    if ISBN_Tools.is_valid_isbn13?(parameter)
      if results.empty?
        render_error_page(404)
      else
        mapped_result = results.map do |result|
          {
            id: result.id,
            title: result.title,
            author: result.authors.map { |author| author_full_name(author) }.join(", "),
            edition: result.edition,
            price: result.list_price,
            isbn_10: result.isbn_10,
            isbn_13: result.isbn_13,
            publisher: result.publisher.name
          }
        end
  
        render json: mapped_result
      end
    else
      render_error_page(400)
    end
  end
  
    
  private
  
  def author_full_name(author)
    [author.first_name, author.middle_name, author.last_name].compact.join(" ")
  end
  

  private

  def render_error_page(status)
    render file: "#{Rails.root}/public/#{status}.html", layout: true, status: status
  end

  def map_book_results(results)
    results.map do |result|
      {
        id: result.id,
        title: result.title,
        author: result.authors.map(&:full_name).join(", "),
        edition: result.edition,
        price: result.list_price,
        isbn_10: result.isbn_10,
        isbn_13: result.isbn_13,
        publisher: result.publisher.name
      }
    end
  end

end
