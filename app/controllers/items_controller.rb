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
       flash[:notice] = "Task was saved."
       redirect_to [@user, @item]
     else
       flash[:error] = "There was an error saving the task. Please try again."
       render :new
     end
   end

   def show
     @user = User.find(params[:user_id])
     @item = Item.find(params[:id])
   end

   def destroy
     @user = User.find(params[:user_id])
     @item = Item.find(params[:id])

     if @item.destroy
       flash[:notice] = "Good job, completing that task!"
     else
       flash[:error] = "Task couldn't be deleted. Try again."
     end

     respond_to do |format|
       format.html
       format.js
     end
  end
  
end
