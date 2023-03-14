class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item= Item.new
    @item.is_active = 1 # 最初に「販売中」を選択させておく。
  end
  
  # いいね機能の内容で実装可能
  # itemからcart_itemへフォームで
  def create
    create = Item.new(item_params)
    create.save
    # binding.pry # データを止める
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active) 
  end
  
end
