class ItemsController < ApplicationController
  before_action :return_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item =Item.new
  end

  def create
    Item.create(Item_params)
  end

  def destroy
    item = Item.find(params[:id])
  end

  #編集と更新はセットで必要
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
    @item = Item.find(params[:id])
  end



  private

  def return_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  #作成と編集で必要
  def Item_params
    params.require(:tweet).permit(:name, :price, :image)
  end

end
