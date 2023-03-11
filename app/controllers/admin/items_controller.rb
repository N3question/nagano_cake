class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all 
  end

  def new
    @item = Item.new
    @item.is_active = 1
  end
  
  def create
    item = Item.new(item_params)
    item.save
    # binding.pry # データを止める
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path
  end
  
  private
  
  def item_params # エラー検出中。質問する。
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active) 
    #.merge(genre_id: genre.id)
  end
  
end
