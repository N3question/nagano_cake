class Public::ItemsController < ApplicationController
  def index
    @genres = Genre.all
    @items = Item.all.page(params[:page]).per(8)
    @items_count =Item.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
  end
end
