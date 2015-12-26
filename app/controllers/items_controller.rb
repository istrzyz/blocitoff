class ItemController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @item.user = current_user
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "\"#{@item.title}\" was deleted successfully."
       redirect_to @item.topic
    else
      flash[:error] = "There was an error deleting the post."
      render :show
    end
  end
end
