class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
  
  # def item_params
  #   params.require(:item).permit(:image, :name, :price,) 
  # end
end
