FactoryBot.define do
  factory :publisher do
    name { "Paste Magazine" }
  end

  factory :book do
    title { "American Elf" }
    isbn_10 { "" }
    isbn_13 { "978-1-891830-85-3" }
    list_price { rand(500..2000) }
    publication_year { "1998" }
    association :publisher
    edition { "Book 2" }
    image_url { "https://www.lambiek.net/share/image.php/american-elf--book-4-.jpg?width=350&image=/catalog/img/1023--50561-800-r8u.jpg" }
  end
end
