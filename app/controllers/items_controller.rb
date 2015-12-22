class ItemController < ApplicationController


  before_action :require_sign_in, except: :show
  before_action :authorize_user, except: [:show, :new, :create]

  def create
    @item = Item.find(params[:item_id])
    @item.user = current_user
  end

  def edit
    @item = Item.find(params[:id])
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
