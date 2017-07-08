require 'roar/json/hal'

module V1
  module Representers
    module TransactionsRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      collection :entries, extend: TransactionRepresenter, as: :companies, embedded: true
    end
  end
end
