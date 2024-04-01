module SeedsServices
  class CreateAuthors < ApplicationService
    def call
      @logger.info 'Processing Author seed file'
      Author.destroy_all
      @logger.info 'Deleted all data from Author model'
      
      author1 = Author.create!(first_name: "Joel", last_name: "Hartse")
      author2 = Author.create!(first_name: "Hannah", middle_name: "P.", last_name: "Templer")
      author3 = Author.create!(first_name: "Marguerite", middle_name: "Z.", last_name: "Duras")
      author4 = Author.create!(first_name: "Kingsley", last_name: "Amis")
      author5 = Author.create!(first_name: "Fannie", middle_name: "Peter", last_name: "Flagg")
      author6 = Author.create!(first_name: "Camille", middle_name: "Byron", last_name: "Paglia")
      author7 = Author.create!(first_name: "Rainer", middle_name: "Steel", last_name: "Rilke")

      @logger.info 'Author has been created'
    end
  end
end