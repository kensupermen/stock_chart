module V1
  class Transaction < BaseApi

    resource :company do
      desc 'List company'

      get do 
        present Company.all, with: Representers::CompaniesRepresenter
        # Company.all
      end

    end
  end
end
