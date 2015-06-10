class UsersController < ApplicationController
  def show
      @user = current_user ? current_user : User.find(params[:id])
      @items = @user.items
      @item = @user.items.new
  end

  private
   def user_params
     params.require(:user).permit(:name, :email)
   end
end
