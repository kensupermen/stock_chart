class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :company_id
      t.datetime :transaction_date
      t.string :open_price
      t.integer :high_price
      t.integer :low_price
      t.integer :close_price
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
