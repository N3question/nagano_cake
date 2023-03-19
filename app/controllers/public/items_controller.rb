class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(8)
    @items_count =Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :price, :is_active) 
  end
end
