class Stock < ApplicationRecord
    has_many :trades
    has_many :users, through: :trades

    validates :ticker_symbol, presence: true

end
