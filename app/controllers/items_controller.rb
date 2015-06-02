class ItemsController < ApplicationController
  respond_to :html, :js

  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = Item.new(item_params)
    @item.user_id = @user.id
     if @item.save
       flash[:notice] = "Task was saved."
     else
       flash[:error] = "There was an error saving the task. Please try again."
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
  end

  private
   def item_params
    params.require(:item).permit(:name, :user_id)
  end
end
