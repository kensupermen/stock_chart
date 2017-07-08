require 'roar/json/hal'

module V1
  module Representers
    module CompaniesRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      collection :entries, extend: CompanyRepresenter, as: :companies, embedded: true
    end
  end
end
