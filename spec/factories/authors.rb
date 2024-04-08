FactoryBot.define do
  factory :author do
    first_name { "Andi" }
    middle_name { "D" }
    last_name { "De Guzman" }
    book_id { rand(1..100) }       
  end
end