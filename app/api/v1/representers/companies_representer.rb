require 'roar/json/hal'

module V1
  module Representers
    module TransactionsRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      collection :entries, extend: TransactionRepresenter, as: :transactions, embedded: true
    end
  end
end
