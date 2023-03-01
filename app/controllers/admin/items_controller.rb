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
    redirect_to '/admin/items'
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :is_active)
  end
  
end
