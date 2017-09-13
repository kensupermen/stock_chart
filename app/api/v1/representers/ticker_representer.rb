module V1
  module Representers
    module TickerRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      property :id
      property :code
      property :name
    end
  end
end
