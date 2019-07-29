class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :ticker_symbol, null: false, limit: 6 
      t.timestamps null: false
    end
  end
end
