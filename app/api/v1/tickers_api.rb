module V1
  class TickersApi < BaseApi

    resource :ticker do

      get do
        present Ticker.all, with: Representers::TickersRepresenter
      end

      get 'search_by_code' do
        params[:scope] = 'all' unless params[:scope]
        ticker = Ticker.find_by!(code: params[:ticker_code])
        Transaction.where(ticker: ticker)
      end

      get 'top_increase' do
        # by date
        # by week
        # by month
        # by year
      end

      get 'top_reduced' do
      end

      get 'should_buy' do
      end
    end
  end
end
