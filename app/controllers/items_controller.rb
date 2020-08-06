class ItemsController < ApplicationController
  before_action :return_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @item =Item.new
  end

  def create
    @item =Item.new(item_params)
    # binding.pry
    if @item.save!

       redirect_to root_path
    else
       render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  #編集と更新はセットで必要
  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    #binding.pry
    item.update(item_params)
    redirect_to root_path
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
  def item_params
    params.require(:item).permit(:name, :text, :price, :image, :category_id, :item_status_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :text).merge(user_id: current_user.id)
  end

end
