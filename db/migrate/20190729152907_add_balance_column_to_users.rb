class AddBalanceColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :cash_balance, :decimal, :precision => 8, :scale => 2
  end
end
