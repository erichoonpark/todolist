class UsersController < ApplicationController
  def show
      @user = current_user ? current_user : User.find(params[:id])
      @items = @user.items
      @item = @user.items.new
    if params[:id].present?
      @user = User.find(params[:id])
      @item = current_user.items
    else
      @user = current_user
      @item = current_user.items
    end
  end


  private
   def user_params
     params.require(:user).permit(:name, :email)
   end
end
