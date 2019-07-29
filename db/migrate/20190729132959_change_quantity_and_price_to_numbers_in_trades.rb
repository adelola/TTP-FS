class ChangeQuantityAndPriceToNumbersInTrades < ActiveRecord::Migration[5.1]
  def up
    change_column :trades, :purchase_price, 'decimal USING CAST(purchase_price AS decimal)', :precision => 8, :scale => 2
    change_column :trades, :quantity, 'integer USING CAST(quantity AS integer)'
  end

  def down
    change_column :trades, :purchase_price, :string
    change_column :trades, :quantity, :string
  end

end
