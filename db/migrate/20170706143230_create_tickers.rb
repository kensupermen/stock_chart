class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.string :code
      t.string :name
      t.string :category

      t.timestamps
    end
    add_index :tickers, :code
  end
end
