class User < ApplicationRecord
  include Clearance::User
  
  has_many :trades, dependent: :destroy
  has_many :stocks, through: :trades

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  def owned_stocks
    self.trades.joins(:stock).group(:ticker_symbol).sum(:quantity)
  end
  
end
