class DashboardsController < ApplicationController

    def show
      @trade = Trade.new
      @stocks = current_user.owned_stocks
    end


end
