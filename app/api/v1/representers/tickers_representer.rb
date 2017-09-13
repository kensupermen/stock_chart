module V1
  module Representers
    module TickersRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      collection :entries, extend: TickerRepresenter, as: :transactions, embedded: true
    end
  end
end
