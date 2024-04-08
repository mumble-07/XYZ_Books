# spec/requests/static_pages_spec.rb
require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /convert_isbn" do
    it "converts valid ISBN-13 to ISBN-10" do
      isbn_13 = "978-1-891830-85-3"
      get "/convert/#{isbn_13}"
      expect(response.body).to eq("1-891830-85-6")
    end

    it "converts valid ISBN-10 to ISBN-13" do
      isbn_10 = "1-891830-85-6"
      get "/convert/#{isbn_10}"
      expect(response.body).to eq("978-1-89183-085-3")
    end

    it "renders error page for invalid ISBN" do
      isbn = "invalid_isbn"
      get "/convert/#{isbn}"
      expect(response).to render_template(layout: "layouts/application")
    end
    
  end

  describe "GET /search" do
    # it "returns http success for valid ISBN" do
    #   isbn = "978-1-891830-85-3"
    #   puts "Debug: ISBN: #{isbn}"
    #   get "/search?=#{isbn}"
    #   puts "Debug: Response Body: #{response.body}"
    #   expect(response).to have_http_status(:success)
    # end
    
    it "renders error page for invalid ISBN" do
      isbn = "invalid_isbn"
      get search_path(search: isbn)
      expect(response).to render_template(layout: "layouts/application") #error 400
    end

    it "renders error page if no books found" do
      isbn = "non_existing_isbn"
      get search_path(search: isbn)
      expect(response).to render_template(layout: "layouts/application") #error 404
    end
  end

  describe "GET /api_book" do
    it "returns http success for valid ISBN-13" do
      isbn = "978-1-891830-02-0"
      get "/books/#{isbn}"
      expect(response).to render_template(layout: "layouts/application")
    end    

    it "renders error page if no book found for valid ISBN" do
      isbn = "non_existing_isbn"
      get "/books/#{isbn}"
      expect(response).to render_template(layout: "layouts/application") # 404
    end
  end  
end
