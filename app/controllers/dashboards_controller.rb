class DashboardsController < ApplicationController

    def show
      @trade = Trade.new
      @stocks = current_user.owned_stocks
      @balance = current_user[:cash_balance]
    end


end
