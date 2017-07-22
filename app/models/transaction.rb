class Transaction < ApplicationRecord

  tickers = Company.all
  list_ticker = []
  tickers.each do |t|
    list_ticker << { t.code => t.id }
  end

  scope :today, -> { where('transaction_date = ?', Date.today) }
  scope :this_week, -> { get_transaction_by_transaction_date(Date.today.at_beginning_of_week, Date.today.at_end_of_week) }
  scope :find_by_ticker, ->(ticker_code) { where(company_id: list_ticker[ticker_code]) }
  
  private 
  def self.get_transaction_by_transaction_date(from_date, to_date)
    where('transaction_date BETWEEN ? AND ?', from_date, to_date)
  end

end
