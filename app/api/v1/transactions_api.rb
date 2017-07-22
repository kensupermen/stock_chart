module V1
  class TransactionsApi < BaseApi
    require 'csv'

    def self.import
      CSV.foreach('data_hcm.csv', headers: true) do |row|
        ticker = Ticker.find_or_create_by(code: row[0])
        Transaction.find_or_create_by(ticker_id: ticker.id,
                                      transaction_date: Date.parse(row[1]),
                                      open_price: row[2],
                                      high_price: row[3],
                                      low_price: row[4],
                                      close_price: row[5],
                                      volume: row[6])
      end
    end

    resources :transactions do
      desc 'List company'

      get 'import_data' do
        TransactionsApi.import
      end

      get '/' do
        present Transaction.this_week, with: Representers::TransactionsRepresenter
      end
    end
  end
end
