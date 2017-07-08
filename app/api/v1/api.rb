module V1
  class Api < Grape::API
    prefix :api
    version 'v1', using: :path
    format :json

    mount Transaction
  end
end
