class UsersController < Clearance::UsersController
    private

    def new
        @user = User.new        
    end

    def user_params
        params.require(:user).permit(:name, :cash_balance, :email, :password)
    end

end
