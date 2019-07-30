class Stock < ApplicationRecord
    has_many :trades
    has_many :users, through: :trades

    validates :ticker_symbol, presence: true

    def self.current_price(ticker_symbol)
        
        client = IEX::Api::Client.new(
            publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        quote = client.quote(ticker_symbol)
        quote.latest_price
    end

    def self.performance(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        quote = client.quote(ticker_symbol)
        quote.change  
    end  

end
