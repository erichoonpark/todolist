class ItemsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(params.require(:item).permit(:name))
    @item.user_id = @user.id
     if @item.save
       flash[:notice] = "Item was saved."
       redirect_to [@user, @item]
     else
       flash[:error] = "There was an error saving the item. Please try again."
       render :new
     end
   end

   def show
     @user = User.find(params[:user_id])
     @item = Item.find(params[:id])
   end
end
