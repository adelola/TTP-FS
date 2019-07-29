class TradesController < ApplicationController
    def create
      
        @stock = Stock.find_or_create_by(ticker_symbol: params[:stock][:ticker_symbol])
        @purchase_price = 15
        @trade = current_user.trades.create(quantity: params[:trade][:quantity], stock_id: @stock.id, purchase_price: @purchase_price)

      if @trade.save
        flash[:success] = "Trade complete!"
        redirect_to root_path
      else
        redirect_to root_path        
      end

    end

    def trades_params
        params.require(:trade).permit(:quantity, stocks_attributes: [:ticker_symbol])
    end
end
