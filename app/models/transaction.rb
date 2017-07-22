class Transaction < ApplicationRecord
  belongs_to :ticker

  scopes = { all: '1=1',
             week: "BETWEEN #{Date.today.at_beginning_of_week} AND #{Date.today.at_end_of_week}",
             month: "BETWEEN #{Date.today.at_beginning_of_month} AND #{Date.today.at_end_of_month}" }

  list_ticker = []
  tickers = Ticker.all
  tickers.each do |t|
    list_ticker << { t.code => t.id }
  end

  scope :today, -> { where('transaction_date = ?', Date.today) }
  scope :this_week, -> { get_transaction_by_transaction_date(Date.today.at_beginning_of_week, Date.today.at_end_of_week) }
  scope :find_by_ticker, ->(ticker_code) { where(ticker_id: list_ticker[ticker_code]) }

  def get_ticker(scope = scopes[:all])
    Ticker.joins(:transactions).where("transaction_date #{scope}")
  end

  private

  def get_percent(price_from, price_to)
    (price_to * 100) / price_from
  end

  def get_transaction_by_transaction_date(from_date, to_date)
    where('transaction_date BETWEEN ? AND ?', from_date, to_date)
  end
end
