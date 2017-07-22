module V1
  class TickersApi < BaseApi

    resource :ticker do

      get do
        present Ticker.all, with: Representers::TickersRepresenter
      end

    end
  end
end
