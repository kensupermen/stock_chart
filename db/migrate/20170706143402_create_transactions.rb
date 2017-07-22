class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :company_id
      t.date :transaction_date
      t.decimal :open_price
      t.decimal :high_price
      t.decimal :low_price
      t.decimal :close_price
      t.bigint :volume

      t.timestamps
    end
    add_index :transactions, :transaction_date
    add_index :transactions, :open_price
    add_index :transactions, :high_price
    add_index :transactions, :low_price
    add_index :transactions, :close_price
    add_index :transactions, :volume
  end
end
