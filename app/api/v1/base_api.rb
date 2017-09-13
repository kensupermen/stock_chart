module V1
  class BaseApi < Grape::API
    content_type :json, 'application/json'
    formatter :json, Grape::Formatter::Roar
  end
end
