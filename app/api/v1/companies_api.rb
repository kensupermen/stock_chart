module V1
  class CompaniesApi < BaseApi

    resource :company do

      get do
        present Company.all, with: Representers::CompaniesRepresenter
      end

    end
  end
end
