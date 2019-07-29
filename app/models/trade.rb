class Trade < ApplicationRecord
    belongs_to :user
    belongs_to :stock

    accepts_nested_attributes_for :stock

    validates :purchase_price, :quantity, presence: true
    validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
