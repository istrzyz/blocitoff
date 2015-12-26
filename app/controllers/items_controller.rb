class ItemController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @item.user = current_user
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted"
    else
      flash[:error] = "There was an error deleting the item."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
