class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all.order(created_at: :desc) # 投稿データを新しい順に並び替え
  end

  def about
  end
end
