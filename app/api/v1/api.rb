module V1
  class Api < Grape::API
    prefix :api
    version 'v1', using: :path
    format :json

    mount TransactionsApi
    mount TickersApi
  end
end
