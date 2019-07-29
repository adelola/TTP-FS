class Trade < ApplicationRecord
    belongs_to :user
    belongs_to :stock

    accepts_nested_attributes_for :stock

    validates :purchase_price, :quantity, presence: true
end
