class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :code
      t.string :name
      t.string :category

      t.timestamps
    end
    add_index :companies, :code
  end
end
