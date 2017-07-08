require 'roar/json/hal'

module V1
  module Representers
    module CompanyRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      property :id
      property :code
      property :name
    end
  end
end
