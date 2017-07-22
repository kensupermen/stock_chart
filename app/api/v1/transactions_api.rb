module V1
  class TransactionsApi < BaseApi
    require 'csv'

    def self.import
      CSV.foreach('data_hcm.csv', headers: true) do |row|
        company = Company.find_or_create_by(code: row[0])
        Transaction.find_or_create_by(company_id: company.id,
                                      transaction_date: Date.parse(row[1]),
                                      open_price: row[2],
                                      high_price: row[3],
                                      low_price: row[4],
                                      close_price: row[5],
                                      volume: row[6])
      end
    end

    resource :transaction do
      desc 'List company'

      get 'import_data' do 
        TransactionApi.import
      end

      get '/' do
        present Transaction.this_week, with: Representers::TransactionsRepresenter
      end
    end
  end
end
