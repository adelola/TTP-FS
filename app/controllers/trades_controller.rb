class TradesController < ApplicationController
    def index
       @trades= current_user.trades.reverse
    end
    
    
    def create
        @stock = Stock.find_or_create_by(ticker_symbol: params[:stock][:ticker_symbol])
        @quantity = params[:trade][:quantity].to_i
        @purchase_price = 15
        cost = @purchase_price * @quantity
        
        if cost > current_user[:cash_balance] 
          flash[:alert] = "You have insufficient funds to complete this transaction."
          redirect_to root_path
        else
           @trade = current_user.trades.create(quantity: @quantity, stock_id: @stock.id, purchase_price: @purchase_price)
           if @trade.save
            new_balance =  current_user[:cash_balance] - cost
            current_user.update(cash_balance: new_balance)
            current_user.save
            flash[:success] = "Trade complete!"
            redirect_to root_path
          else
            redirect_to root_path        
          end
        end
          
        
      

    end

    def trades_params
        params.require(:trade).permit(:quantity, stocks_attributes: [:ticker_symbol])
    end
end
