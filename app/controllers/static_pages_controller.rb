class StaticPagesController < ApplicationController
  
  def index
  end

  def search
    parameter = params[:search]
    if ISBN_Tools.is_valid?(parameter)
      @results = Book.where("books.isbn_10 || books.isbn_13 LIKE ?", ["%#{parameter}%"])
    else
      render :file => "#{Rails.root}/public/400.html", layout: false, status: :bad_request and return
    end
  end

  def api_book
    parameter = params[:isbn]
    results = Book.where("books.isbn_10 || books.isbn_13 LIKE ?", ["%#{parameter}%"])

    if ISBN_Tools.is_valid_isbn13?(parameter)
      if results.exists?
        mapped_result = 
        results.map { |result| {
          id: result.id,
          title: result.title,
          author: result.authors.pluck(:first_name, :middle_name, :last_name).map { |name| name.join(" ") }.join(", "),
          edition: result.edition,
          price: result.list_price,
          isbn_10: result.isbn_10,
          isbn_13: result.isbn_13,
          publisher: result.publisher.name
        } }

        render json: mapped_result and return
      else
        render :file => "#{Rails.root}/public/404.html", layout: false, status: :not_found and return
      end
    else
      render :file => "#{Rails.root}/public/400.html", layout: false, status: :bad_request and return
    end 
  end

  def convert_isbn
    parameter = params[:isbn].delete('-')

    if ISBN_Tools.is_valid?(parameter)
      if parameter.length == 13
        result = ISBN_Tools.isbn13_to_isbn10(parameter)

        hyphenated = ISBN_Tools.hyphenate_isbn10(result).to_s

        render body: hyphenated and return
      elsif
        parameter.length == 10
        result =  ISBN_Tools.isbn10_to_isbn13(parameter)

        hyphenated = ISBN_Tools.hyphenate_isbn13(result).to_s

        render body: hyphenated and return
      end
    else
      render :file => "#{Rails.root}/public/400.html", layout: false, status: :bad_request and return
    end
  end

end
