module SeedsServices
  class CreatePublishers < ApplicationService
    def call
      @logger.info 'Processing Admin seed file'
      Publisher.destroy_all # destroy all publisher data first
      @logger.info 'Deleted all data from Publisher model'
      
      publisher1 = Publisher.create!(name: "Paste Magazine")
      publisher2 = Publisher.create!(name: "Publishers Weekly")
      publisher3 = Publisher.create!(name: "Graywolf Press")
      publisher4 = Publisher.create!(name: "McSweeney's")

      @logger.info 'Publishers has been created'
    end
  end
end
