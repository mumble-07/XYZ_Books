FactoryBot.define do
  factory :author do
    first_name { "Joel" }
    middle_name { "" }
    last_name { "Hartse" }
    
    # Using a transient attribute to generate associations with books
    transient do
      books_count { 1 } # Default to 1 book association
    end

    # After creating an author, associate it with books
    after(:create) do |author, evaluator|
      create_list(:book, evaluator.books_count, authors: [author])
    end
  end
end
