class ItemsController < ApplicationController

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash.now[:notice] = "Item create"
    else
      flash.now[:error] = "Somthing went wrong"
    end

    redirect_to current_user
  end

  def destroy
    @item = current_user.items.destroy(item_params)

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

  private
  def item_params
    params.require(:item).permit(:name)
  end
end
