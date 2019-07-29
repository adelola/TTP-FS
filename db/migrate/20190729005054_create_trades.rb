class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.string :purchase_price
      t.string :quantity
      t.references :user, foreign_key: true
      t.references :stock, foreign_key: true
      t.timestamps
    end
  end
end
