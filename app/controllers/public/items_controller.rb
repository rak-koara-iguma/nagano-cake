class Public::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items =Item.all
   # @items = Item.where(is_active: true)
  end
end
