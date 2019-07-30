class Stock < ApplicationRecord
    has_many :trades
    has_many :users, through: :trades

    validates :ticker_symbol, presence: true

    def self.current_price(ticker_symbol)
        begin
        @client = IEX::Api::Client.new(
            publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
            endpoint: 'https://cloud.iexapis.com/v1'
          )
        @price = @client.quote(ticker_symbol).latest_price
        rescue StandardError => e
            puts "#{e.class}: #{e.message}"
        
        end
    end

    def self.color(ticker_symbol)
        begin
            client = IEX::Api::Client.new(
                publishable_token: ENV['IEX_API_PUBLISHABLE_TOKEN'],
                endpoint: 'https://cloud.iexapis.com/v1'
            )
            performance = client.quote(ticker_symbol).change
            rescue StandardError => e
                puts "#{e.class}: #{e.message}"
        end

        if performance < 0
            @color = "red"
        elsif performance == 0 
            @color= "grey"
        else
            @color = "green"
        end
        @color
    end
    
    def self.aggregate_value(ticker, quantity)
        current_price = Stock.current_price(ticker).to_f
        @value = current_price * quantity
    end

end
