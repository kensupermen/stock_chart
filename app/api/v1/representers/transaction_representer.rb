require 'roar/json/hal'

module V1
  module Representers
    module TransactionRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      property :company_id
      property :open_price
      property :high_price
      property :low_price
      property :close_price
      property :volume
    end
  end
end
