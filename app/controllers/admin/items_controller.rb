class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @item= Item.new
    @item.is_active = 1 # 最初に「販売中」を選択させておく。
  end
  
  # いいね機能の内容で実装可能
  # itemからcart_itemへフォームで。
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
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
  
  # 任意アクション
  def destroy
    item = Item.find(params[:id])  # データ（レコード）を1件取得
    item.destroy  # データ（レコード）を削除
    redirect_to admin_items_path  # 投稿一覧画面へリダイレクト  
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active) 
  end
  
end
